import Foundation

/// Golven: laagdoorgelaten ruis met een trage, golvende amplitude — het
/// aanrollen-en-terugtrekken-ritme van oceaangolven op een strand.
final class GolvenGenerator: GeluidGenerator {
    private var laagdoorlaatToestand: Float = 0
    private var faseGolf: Float = 0

    func volgendeSample(sampleRate: Double) -> Float {
        let wit = Float.random(in: -1...1)

        // Laagdoorlaatfilter voor een dieper, doffer geluid dan regen.
        laagdoorlaatToestand += 0.04 * (wit - laagdoorlaatToestand)

        // Golfritme: een aanrollende golf duurt ongeveer 6-8 seconden.
        faseGolf += Float(1.0 / sampleRate) * 0.14
        let golf = 0.5 + 0.5 * sin(faseGolf * 2 * .pi)
        // Golven rollen sneller aan dan ze terugtrekken — asymmetrische curve.
        let asymmetrisch = pow(golf, 1.6)

        return laagdoorlaatToestand * (0.3 + 0.7 * asymmetrisch)
    }
}
