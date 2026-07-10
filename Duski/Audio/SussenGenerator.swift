import Foundation

/// Sussen: het klassieke ouder-"shhh"-geluid — scherp hoogdoorgelaten ruis met
/// een zacht, herhalend ritme, zoals ouders van nature gebruiken om baby's te
/// kalmeren (het "shush"-effect uit onderzoek/01_demografie_wetenschap_appstore.md).
final class SussenGenerator: GeluidGenerator {
    private var hoogToestand: Float = 0
    private var faseRitme: Float = 0

    func volgendeSample(sampleRate: Double) -> Float {
        let wit = Float.random(in: -1...1)
        hoogToestand += 0.5 * (wit - hoogToestand)
        let hoog = wit - hoogToestand

        faseRitme += Float(1.0 / sampleRate) * 0.5
        let ritme = 0.6 + 0.4 * sin(faseRitme * 2 * .pi)

        return hoog * ritme * 0.55
    }
}
