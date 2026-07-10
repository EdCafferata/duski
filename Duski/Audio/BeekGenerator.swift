import Foundation

/// Beek: middenband-gefilterde ruis met een snel, "borrelend" dubbel-sinusritme
/// erbovenop — het kabbelen van stromend water over stenen, lichter en sneller
/// dan de trage golfbeweging van golven.
final class BeekGenerator: GeluidGenerator {
    private var bandToestand: Float = 0
    private var fase1: Float = 0
    private var fase2: Float = 0

    func volgendeSample(sampleRate: Double) -> Float {
        let wit = Float.random(in: -1...1)
        bandToestand += 0.22 * (wit - bandToestand)

        let dt = Float(1.0 / sampleRate)
        fase1 += dt * 3.1
        fase2 += dt * 4.7
        let kabbel = 0.5 + 0.25 * sin(fase1 * 2 * .pi) + 0.25 * sin(fase2 * 2 * .pi)

        return bandToestand * (0.4 + 0.6 * kabbel) * 0.6
    }
}
