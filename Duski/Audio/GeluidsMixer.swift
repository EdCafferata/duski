import AVFoundation
import Combine

/// Beheert de audio-graaf: elke actieve geluidslaag krijgt een eigen
/// AVAudioSourceNode die zijn generator sample-voor-sample uitvraagt, gemixt via
/// AVAudioEngine's mainMixerNode. Alles 100% on-device gegenereerd.
final class GeluidsMixer: ObservableObject {
    private let engine = AVAudioEngine()
    private var nodes: [String: AVAudioSourceNode] = [:]
    private var generators: [String: GeluidGenerator] = [:]

    @Published private(set) var actieveOpties: Set<String> = []
    @Published var volumes: [String: Float] = [:]

    private var maximaalVolume: Float = 1.0

    init() {
        let sessie = AVAudioSession.sharedInstance()
        try? sessie.setCategory(.playback, mode: .default, options: [.mixWithOthers])
        try? sessie.setActive(true)
    }

    func stelMaximaalVolumeIn(_ waarde: Float) {
        maximaalVolume = waarde
        for (id, volume) in volumes {
            volumes[id] = min(volume, waarde)
        }
    }

    func zetVolume(voor optie: GeluidOptie, naar waarde: Float) {
        let begrensd = min(waarde, maximaalVolume)
        volumes[optie.id] = begrensd
    }

    func isActief(_ optie: GeluidOptie) -> Bool {
        actieveOpties.contains(optie.id)
    }

    /// Slechts één geluid tegelijk actief: een nieuwe keuze stopt eerst alle
    /// andere lagen, zodat altijd de laatste keuze overblijft.
    func schakel(_ optie: GeluidOptie) {
        if isActief(optie) {
            stopLaag(id: optie.id)
        } else {
            for id in Array(actieveOpties) {
                stopLaag(id: id)
            }
            startLaag(optie)
        }
    }

    private func startLaag(_ optie: GeluidOptie) {
        let generator = GeluidGeneratorFabriek.maak(voor: optie.type)
        generators[optie.id] = generator
        if volumes[optie.id] == nil {
            volumes[optie.id] = min(0.7, maximaalVolume)
        }

        let format = engine.mainMixerNode.outputFormat(forBus: 0)
        let sampleRate = format.sampleRate

        let node = AVAudioSourceNode { [weak self, weak generator] _, _, frameCount, audioBufferList -> OSStatus in
            guard let generator = generator else { return noErr }
            let volume = self?.volumes[optie.id] ?? 0
            let buffers = UnsafeMutableAudioBufferListPointer(audioBufferList)
            for frame in 0..<Int(frameCount) {
                let sample = generator.volgendeSample(sampleRate: sampleRate) * volume
                for buffer in buffers {
                    let bufferPointer = UnsafeMutableBufferPointer<Float>(buffer)
                    bufferPointer[frame] = sample
                }
            }
            return noErr
        }

        engine.attach(node)
        engine.connect(node, to: engine.mainMixerNode, format: format)
        nodes[optie.id] = node

        if !engine.isRunning {
            try? engine.start()
        }
        actieveOpties.insert(optie.id)
    }

    private func stopLaag(id: String) {
        guard let node = nodes[id] else { return }
        engine.disconnectNodeOutput(node)
        engine.detach(node)
        nodes[id] = nil
        generators[id] = nil
        actieveOpties.remove(id)

        if actieveOpties.isEmpty {
            engine.stop()
        }
    }

    func stopAlles() {
        for id in Array(actieveOpties) {
            guard let node = nodes[id] else { continue }
            engine.disconnectNodeOutput(node)
            engine.detach(node)
        }
        nodes.removeAll()
        generators.removeAll()
        actieveOpties.removeAll()
        engine.stop()
    }
}
