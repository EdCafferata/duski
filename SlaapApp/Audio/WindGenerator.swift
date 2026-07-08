import Foundation

/// Wind: breedbandruis met een trage, onregelmatige sterkte-modulatie (vlagen),
/// iets hoger gefilterd dan golven zodat het als "lucht" en niet als "water" klinkt.
final class WindGenerator: GeluidGenerator {
    private var bandToestand: Float = 0
    private var vlaagFase: Float = 0
    private var vlaagSterkte: Float = 0.6

    func volgendeSample(sampleRate: Double) -> Float {
        let wit = Float.random(in: -1...1)
        bandToestand += 0.09 * (wit - bandToestand)

        vlaagFase += Float(1.0 / sampleRate) * 0.05
        if Float.random(in: 0...1) < 0.001 {
            vlaagSterkte = Float.random(in: 0.3...1.0)
        }
        let vlaag = 0.5 + 0.5 * sin(vlaagFase * 2 * .pi) * vlaagSterkte

        return bandToestand * (0.4 + 0.6 * vlaag)
    }
}
