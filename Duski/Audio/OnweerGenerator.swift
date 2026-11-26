import Foundation

/// Onweer: zachte regen met af en toe een verre donderslag — een traag aanzwellend
/// en lang uitrommelend laag gerommel (sterk laagdoorgelaten bruine ruis). Geen
/// harde klappen: het moet in slaap helpen, niet wekken.
final class OnweerGenerator: GeluidGenerator {
    private let regen = RegenGenerator()
    private var bruin: Float = 0
    private var laag1: Float = 0
    private var laag2: Float = 0
    private var tijdTotDonder: Double = 6
    private var tijdInDonder: Double = -1
    private var donderDuur: Double = 6
    private var donderSterkte: Float = 1
    private var flakkerFase: Float = 0

    func volgendeSample(sampleRate: Double) -> Float {
        let dt = 1.0 / sampleRate
        let wit = Float.random(in: -1...1)

        if tijdInDonder < 0 {
            tijdTotDonder -= dt
            if tijdTotDonder <= 0 {
                tijdInDonder = 0
                donderDuur = Double.random(in: 5...9)
                donderSterkte = Float.random(in: 0.6...1.0)
            }
        }

        var donder: Float = 0
        if tijdInDonder >= 0 {
            tijdInDonder += dt
            // Langzaam aanzwellen (~0,6 s), dan exponentieel uitrommelen.
            let aanzet = min(tijdInDonder / 0.6, 1.0)
            let uitsterf = exp(-max(tijdInDonder - 0.6, 0) / (donderDuur / 3))
            // Trage "rommel"-modulatie zodat het niet als één ruisblok klinkt.
            flakkerFase += Float(dt) * 1.7
            if flakkerFase >= 1 { flakkerFase -= 1 }  // fase binnen 0..<1 houden
            let rommel = 0.7 + 0.3 * sin(flakkerFase * 2 * .pi)

            bruin = (bruin + 0.02 * wit) / 1.02
            laag1 += 0.02 * (bruin - laag1)
            laag2 += 0.02 * (laag1 - laag2)
            donder = laag2 * 6 * Float(aanzet * uitsterf) * rommel * donderSterkte

            if tijdInDonder >= donderDuur {
                tijdInDonder = -1
                tijdTotDonder = Double.random(in: 15...40)
            }
        }

        // Zachte begrenzing (tanh): ook als regen en donder samen pieken, nooit hard clippen.
        return tanh(regen.volgendeSample(sampleRate: sampleRate) * 0.8 + donder)
    }
}
