import Foundation

/// Autorijden: het gelijkmatige motorgebrom en bandengeruis van een rijdende
/// auto op de snelweg, met af en toe een korte hobbel/voegovergang — een
/// bekend geluid waar veel mensen (en baby's) van in slaap vallen.
final class AutorijdenGenerator: GeluidGenerator {
    private var faseMotor: Float = 0
    private var wegToestand: Float = 0
    private var hobbelEnergie: Float = 0

    func volgendeSample(sampleRate: Double) -> Float {
        faseMotor += Float(1.0 / sampleRate) * 45
        let motor = sin(faseMotor * 2 * .pi) * 0.2

        let wit = Float.random(in: -1...1)
        wegToestand += 0.1 * (wit - wegToestand)
        let weggeluid = wegToestand * 0.5

        if Float.random(in: 0...1) < 0.0008 {
            hobbelEnergie = Float.random(in: 0.3...0.7)
        }
        hobbelEnergie *= 0.97
        let hobbel = wit * hobbelEnergie * 0.3

        return motor + weggeluid + hobbel
    }
}
