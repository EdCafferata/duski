import Foundation

/// Regen: hoogdoorgelaten ruis (het "gesis") met willekeurige druppel-transiënten
/// erbovenop, plus een trage volume-ademhaling zodat het niet helemaal statisch klinkt.
final class RegenGenerator: GeluidGenerator {
    private var hoogdoorlaatToestand: Float = 0
    private var druppelEnergie: Float = 0
    private var faseAdemhaling: Float = 0

    func volgendeSample(sampleRate: Double) -> Float {
        let wit = Float.random(in: -1...1)

        // Eenvoudig eerste-orde hoogdoorlaatfilter voor het "sissende" regengeluid.
        let hoogdoorlaat = wit - hoogdoorlaatToestand
        hoogdoorlaatToestand += 0.15 * hoogdoorlaat

        // Willekeurige druppel-transiënten: af en toe een kort energiestootje.
        if Float.random(in: 0...1) < 0.0025 {
            druppelEnergie = Float.random(in: 0.3...1.0)
        }
        druppelEnergie *= 0.995
        let druppels = wit * druppelEnergie * 0.6

        // Trage amplitude-ademhaling (regenbuien-gevoel).
        faseAdemhaling += Float(1.0 / sampleRate) * 0.07
        let ademhaling = 0.75 + 0.25 * sin(faseAdemhaling * 2 * .pi)

        return (hoogdoorlaat * 0.5 + druppels) * ademhaling * 0.5
    }
}
