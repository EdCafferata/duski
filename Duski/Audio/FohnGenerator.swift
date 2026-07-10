import Foundation

/// Föhn: het motorgezoem (vaste lage toon) plus luchtstroom-ruis van een föhn of
/// stofzuiger — het klassieke "witte-ruis-apparaat"-geluid waarmee veel ouders
/// baby's in slaap sussen.
final class FohnGenerator: GeluidGenerator {
    private var faseMotor: Float = 0
    private var laagdoorlaatToestand: Float = 0

    func volgendeSample(sampleRate: Double) -> Float {
        faseMotor += Float(1.0 / sampleRate) * 100
        let motor = sin(faseMotor * 2 * .pi) * 0.25

        let wit = Float.random(in: -1...1)
        laagdoorlaatToestand += 0.25 * (wit - laagdoorlaatToestand)
        let luchtstroom = laagdoorlaatToestand * 0.6

        return motor + luchtstroom
    }
}
