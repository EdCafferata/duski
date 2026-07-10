import Foundation

/// Geïnspireerd op de beroemde dalende baslijn uit Pachelbels Canon in D —
/// Pachelbel overleed in 1706, dus deze compositie is allang rechtenvrij.
final class CanonGenerator: MelodieGenerator {
    init() {
        let d3 = 146.83, a2 = 110.00, b2 = 123.47, fis2 = 92.50
        let g2 = 98.00, d2 = 73.42
        let noten: [MelodieNoot] = [d3, a2, b2, fis2, g2, d2, g2, a2].map {
            MelodieNoot(frequentie: $0, tellen: 2)
        }
        super.init(noten: noten, tempoBpm: 60)
    }
}
