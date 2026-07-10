import Foundation

/// Geïnspireerd op de gebroken-akkoord-figuur uit Bachs Prelude in C majeur
/// (BWV 846, Wohltemperierte Klavier I) — Bach overleed in 1750, dus deze
/// compositie is allang rechtenvrij.
final class BachPreludeGenerator: MelodieGenerator {
    init() {
        let c4 = 261.63, e4 = 329.63, g4 = 392.00, c5 = 523.25, e5 = 659.25
        let noten: [MelodieNoot] = [c4, e4, g4, c5, e5, g4, c5, e5].map {
            MelodieNoot(frequentie: $0, tellen: 0.5)
        }
        super.init(noten: noten, tempoBpm: 66)
    }
}
