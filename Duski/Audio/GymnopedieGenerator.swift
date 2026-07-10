import Foundation

/// Geïnspireerd op het herkenbare, zwevende akkoordenpatroon uit Saties
/// Gymnopédie nr. 1 — Satie overleed in 1925, dus deze compositie is allang
/// rechtenvrij.
final class GymnopedieGenerator: MelodieGenerator {
    init() {
        let g3 = 196.00, d4 = 293.66, a3 = 220.00, b3 = 246.94, fis4 = 369.99
        let noten: [MelodieNoot] = [
            MelodieNoot(frequentie: g3, tellen: 1),
            MelodieNoot(frequentie: d4, tellen: 1),
            MelodieNoot(frequentie: b3, tellen: 1),
            MelodieNoot(frequentie: a3, tellen: 1),
            MelodieNoot(frequentie: d4, tellen: 1),
            MelodieNoot(frequentie: fis4, tellen: 1),
            MelodieNoot(frequentie: g3, tellen: 3),
        ]
        super.init(noten: noten, tempoBpm: 72)
    }
}
