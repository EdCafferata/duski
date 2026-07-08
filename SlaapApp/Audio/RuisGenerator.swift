import Foundation

/// Genereert witte, roze of bruine ruis. Roze via Paul Kellet's bekende
/// "economy"-filtercascade (publiek algoritme, geen licentie nodig); bruine ruis via
/// een lekkende integrator van witte ruis.
final class RuisGenerator: GeluidGenerator {
    private let kleur: RuisKleur

    // Toestand voor roze ruis (Paul Kellet economy method).
    private var b0: Float = 0, b1: Float = 0, b2: Float = 0

    // Toestand voor bruine ruis (lekkende integrator).
    private var bruinToestand: Float = 0

    init(kleur: RuisKleur) {
        self.kleur = kleur
    }

    func volgendeSample(sampleRate: Double) -> Float {
        let wit = Float.random(in: -1...1)

        switch kleur {
        case .wit:
            return wit * 0.5

        case .roze:
            b0 = 0.99765 * b0 + wit * 0.0990460
            b1 = 0.96300 * b1 + wit * 0.2965164
            b2 = 0.57000 * b2 + wit * 1.0526913
            let roze = b0 + b1 + b2 + wit * 0.1848
            return roze * 0.11

        case .bruin:
            bruinToestand = (bruinToestand + (0.02 * wit)) / 1.02
            return bruinToestand * 3.5
        }
    }
}
