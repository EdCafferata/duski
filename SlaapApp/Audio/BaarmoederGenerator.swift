import Foundation

/// Baarmoedergeluiden: een gedempte, laagdoorgelaten "whoosh" (vruchtwater/
/// bloedstroom) met een moederhartslag erdoorheen — de intra-uteriene
/// geluidsomgeving die witte-ruismachines voor baby's proberen na te bootsen
/// (zie onderzoek/01_demografie_wetenschap_appstore.md).
final class BaarmoederGenerator: GeluidGenerator {
    private var laagdoorlaatToestand: Float = 0
    private let hartslag = HartslagGenerator(slagenPerMinuut: 78)

    func volgendeSample(sampleRate: Double) -> Float {
        let wit = Float.random(in: -1...1)

        // Zwaar gedempt: alleen de allerlaagste frequenties komen door.
        laagdoorlaatToestand += 0.03 * (wit - laagdoorlaatToestand)
        let whoosh = laagdoorlaatToestand * 1.5

        let hart = hartslag.volgendeSample(sampleRate: sampleRate) * 0.4

        return whoosh * 0.7 + hart
    }
}
