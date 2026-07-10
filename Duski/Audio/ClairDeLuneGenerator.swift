import Foundation

/// Geïnspireerd op het zachte openingsmotief van Debussy's Clair de Lune —
/// Debussy overleed in 1918, dus deze compositie is inmiddels ruim
/// rechtenvrij.
final class ClairDeLuneGenerator: MelodieGenerator {
    init() {
        let des4 = 277.18, as3 = 207.65, ges3 = 185.00, des3 = 138.59, f3 = 174.61
        let noten: [MelodieNoot] = [
            MelodieNoot(frequentie: des4, tellen: 2),
            MelodieNoot(frequentie: as3, tellen: 1),
            MelodieNoot(frequentie: ges3, tellen: 1),
            MelodieNoot(frequentie: f3, tellen: 2),
            MelodieNoot(frequentie: des3, tellen: 2),
        ]
        super.init(noten: noten, tempoBpm: 48)
    }
}
