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
        case .wind:
            return WindGenerator()
        case .vuur:
            return VuurGenerator()
        case .beek:
            return BeekGenerator()
        case .hartslag:
            return HartslagGenerator()
        case .baarmoeder:
            return BaarmoederGenerator()
        case .ademhaling:
            return AdemhalingGenerator()
        case .sussen:
            return SussenGenerator()
        case .fohn:
            return FohnGenerator()
        case .klankschaal:
            return KlankschaalGenerator()
        case .ventilator:
            return VentilatorGenerator()
        case .trein:
            return TreinGenerator()
        case .klok:
            return KlokGenerator()
        case .vliegtuigcabine:
            return VliegtuigcabineGenerator()
        case .autorijden:
            return AutorijdenGenerator()
        case .bachPrelude:
            return BachPreludeGenerator()
        case .bachAir:
            return BachAirGenerator()
        case .canon:
            return CanonGenerator()
        case .gymnopedie:
            return GymnopedieGenerator()
        case .clairDeLune:
            return ClairDeLuneGenerator()
        }
    }
}
