import Foundation

/// Elke geluidslaag genereert zijn eigen audio sample-voor-sample — 100% zelf
/// geprogrammeerd, geen opnames of samples van derden nodig (geen rechtenrisico).
protocol GeluidGenerator: AnyObject {
    func volgendeSample(sampleRate: Double) -> Float
}

/// Bouwt de juiste generator voor een gegeven geluidstype.
enum GeluidGeneratorFabriek {
    static func maak(voor type: GeluidType) -> GeluidGenerator {
        switch type {
        case .ruis(let kleur):
            return RuisGenerator(kleur: kleur)
        case .regen:
            return RegenGenerator()
        case .golven:
            return GolvenGenerator()
        case .hartslag:
            return HartslagGenerator()
        case .baarmoeder:
            return BaarmoederGenerator()
        case .klankschaal:
            return KlankschaalGenerator()
        }
    }
}
