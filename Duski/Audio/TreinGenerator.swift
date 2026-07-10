import Foundation

/// Trein: het ritmische "tsjoek-tsjoek" van wielen over railstoten, met een
/// laagfrequent motorgerommel eronder — het monotone treinreisgeluid waarvan
/// bekend is dat het mensen in slaap sust.
final class TreinGenerator: GeluidGenerator {
    private var laagdoorlaatToestand: Float = 0
    private var tijdSindsTik: Double = 0
    private let tikInterval: Double = 0.55

    func volgendeSample(sampleRate: Double) -> Float {
        let wit = Float.random(in: -1...1)
        laagdoorlaatToestand += 0.05 * (wit - laagdoorlaatToestand)

        tijdSindsTik += 1.0 / sampleRate
        if tijdSindsTik >= tikInterval {
            tijdSindsTik -= tikInterval
        }
        let envelope = Float(exp(-tijdSindsTik * 25))
        let tik = wit * envelope * 0.6

        return laagdoorlaatToestand * 0.8 + tik
    }
}
