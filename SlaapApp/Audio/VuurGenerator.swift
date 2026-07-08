import Foundation

/// Kampvuur/haard: laagfrequent gerommel (het "vuur") met willekeurige knetter-
/// transiënten erbovenop (brandend hout).
final class VuurGenerator: GeluidGenerator {
    private var laagdoorlaatToestand: Float = 0
    private var knetterEnergie: Float = 0

    func volgendeSample(sampleRate: Double) -> Float {
        let wit = Float.random(in: -1...1)
        laagdoorlaatToestand += 0.06 * (wit - laagdoorlaatToestand)

        if Float.random(in: 0...1) < 0.0012 {
            knetterEnergie = Float.random(in: 0.5...1.0)
        }
        knetterEnergie *= 0.98
        let knetter = wit * knetterEnergie * 0.7

        return laagdoorlaatToestand * 0.9 + knetter
    }
}
