import Foundation

/// Geïnspireerd op de rustige melodielijn van Bachs "Air" (Orchestral Suite
/// nr. 3, bekend als "Air on the G String") — allang rechtenvrij.
final class BachAirGenerator: MelodieGenerator {
    init() {
        let c4 = 261.63, d4 = 293.66, e4 = 329.63, f4 = 349.23
        let b3 = 246.94
        let noten: [MelodieNoot] = [
            MelodieNoot(frequentie: c4, tellen: 2),
            MelodieNoot(frequentie: b3, tellen: 1),
            MelodieNoot(frequentie: c4, tellen: 1),
            MelodieNoot(frequentie: d4, tellen: 2),
            MelodieNoot(frequentie: e4, tellen: 2),
            MelodieNoot(frequentie: f4, tellen: 1),
            MelodieNoot(frequentie: e4, tellen: 1),
            MelodieNoot(frequentie: d4, tellen: 2),
            MelodieNoot(frequentie: c4, tellen: 4),
        ]
        super.init(noten: noten, tempoBpm: 50)
    }
}
