import Foundation
import Combine

/// Sleeptimer: telt af en dooft de actieve geluidslagen in de laatste 30 seconden
/// geleidelijk uit (zelfde patroon als Noisli/Sleep Cycle), in plaats van abrupt
/// te stoppen.
final class SlaapTimer: ObservableObject {
    @Published private(set) var resterendeSeconden: Int?

    private var timer: Timer?
    private var volumesBijStartUitfaden: [String: Float] = [:]
    private let uitfadeDuur: Int = 30

    var isActief: Bool { resterendeSeconden != nil }

    func start(minuten: Int, mixer: GeluidsMixer) {
        stop()
        resterendeSeconden = minuten * 60
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self, weak mixer] _ in
            guard let mixer = mixer else { return }
            self?.tik(mixer: mixer)
        }
    }

    func stop() {
        timer?.invalidate()
        timer = nil
        resterendeSeconden = nil
        volumesBijStartUitfaden.removeAll()
    }

    private func tik(mixer: GeluidsMixer) {
        guard let resterend = resterendeSeconden else { return }
        let nieuw = resterend - 1
        resterendeSeconden = nieuw

        if nieuw <= 0 {
            mixer.stopAlles()
            stop()
            return
        }

        if nieuw == uitfadeDuur {
            volumesBijStartUitfaden = mixer.volumes
        }

        if nieuw < uitfadeDuur {
            let factor = Float(nieuw) / Float(uitfadeDuur)
            for (id, origineel) in volumesBijStartUitfaden {
                mixer.volumes[id] = origineel * factor
            }
        }
    }
}
