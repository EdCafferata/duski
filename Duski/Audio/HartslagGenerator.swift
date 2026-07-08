import Foundation

/// Hartslag: het klassieke "lub-dub"-tweeklankritme, rond rusthartslag (65 bpm) —
/// exact het tempo dat onderzoek als meest ontspannend voor slaapmuziek aanwijst
/// (zie onderzoek/02_muziek_en_geluidscategorieen.md).
final class HartslagGenerator: GeluidGenerator {
    private let slagenPerMinuut: Double
    private var faseInCyclus: Double = 0

    init(slagenPerMinuut: Double = 65) {
        self.slagenPerMinuut = slagenPerMinuut
    }

    func volgendeSample(sampleRate: Double) -> Float {
        let cyclusDuur = 60.0 / slagenPerMinuut
        faseInCyclus += 1.0 / sampleRate
        if faseInCyclus >= cyclusDuur {
            faseInCyclus -= cyclusDuur
        }

        let lub = puls(op: faseInCyclus, start: 0.0, sterkte: 1.0)
        let dub = puls(op: faseInCyclus, start: cyclusDuur * 0.18, sterkte: 0.6)

        return Float(lub + dub) * 0.8
    }

    /// Eén "bonk": een korte laagfrequente toon met snelle exponentiële uitsterving.
    private func puls(op fase: Double, start: Double, sterkte: Double) -> Double {
        let tijdSindsStart = fase - start
        guard tijdSindsStart >= 0, tijdSindsStart < 0.12 else { return 0 }
        let envelope = exp(-tijdSindsStart * 40)
        let toon = sin(2 * .pi * 55 * tijdSindsStart)
        return toon * envelope * sterkte
    }
}
