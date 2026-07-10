import Foundation

/// Ademhaling: laagdoorgelaten ruis (de "lucht" van in- en uitademen) met een
/// trage amplitude-envelope die het inademen-uitademen-ritme volgt (~6 seconden
/// per cyclus, een rustig ademtempo). Inademen bouwt iets sneller op dan
/// uitademen afbouwt — asymmetrisch, net als een echte ademhaling.
final class AdemhalingGenerator: GeluidGenerator {
    private var laagdoorlaatToestand: Float = 0
    private var faseCyclus: Float = 0

    func volgendeSample(sampleRate: Double) -> Float {
        let wit = Float.random(in: -1...1)
        laagdoorlaatToestand += 0.08 * (wit - laagdoorlaatToestand)

        faseCyclus += Float(1.0 / sampleRate) * 0.17
        let raw = 0.5 + 0.5 * sin(faseCyclus * 2 * .pi)
        let envelope = pow(raw, 1.4)

        return laagdoorlaatToestand * (0.2 + 0.8 * envelope) * 0.7
    }
}
