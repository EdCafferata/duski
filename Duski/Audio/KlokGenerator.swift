import Foundation

/// Tikkende klok: een regelmatig tik-tak-ritme (1 seconde per tik) zoals een
/// mechanische wandklok — voor wie graag bij een vertrouwd, voorspelbaar ritme
/// inslaapt.
final class KlokGenerator: GeluidGenerator {
    private var tijdSindsTik: Double = 0
    private var tikIsTak = false
    private let tikInterval: Double = 1.0

    func volgendeSample(sampleRate: Double) -> Float {
        tijdSindsTik += 1.0 / sampleRate
        if tijdSindsTik >= tikInterval {
            tijdSindsTik -= tikInterval
            tikIsTak.toggle()
        }

        let frequentie = tikIsTak ? 1400.0 : 1000.0
        let envelope = exp(-tijdSindsTik * 90)
        guard envelope > 0.001 else { return 0 }
        let toon = sin(2 * .pi * frequentie * tijdSindsTik)

        return Float(toon * envelope) * 0.4
    }
}
