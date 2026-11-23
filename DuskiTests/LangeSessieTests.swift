import XCTest
@testable import Duski

/// Regressietest: de fase van langzame modulaties (golven, ademhaling, motorbrom, …) liep als
/// Float eindeloos op en verloor na 2–6 minuten precisie, waarna het geluid "bevroor"
/// (golven golfden niet meer). Na 9 minuten (bevroor vroeger vanaf ~7,6 min) moet de golfbeweging er nog zijn.
final class LangeSessieTests: XCTestCase {
    func testGolvenBlijvenGolvenNaNegenMinuten() {
        let sampleRate = 48_000.0
        let g = GolvenGenerator()
        for _ in 0..<Int(sampleRate * 540) { _ = g.volgendeSample(sampleRate: sampleRate) }
        // Golfperiode ~7 s: meet de luidheid per halve seconde over 10 s.
        var rmsPerBlok: [Float] = []
        let blok = Int(sampleRate / 2)
        for _ in 0..<20 {
            var som: Float = 0
            for _ in 0..<blok { let v = g.volgendeSample(sampleRate: sampleRate); som += v * v }
            rmsPerBlok.append(sqrt(som / Float(blok)))
        }
        let verhouding = (rmsPerBlok.max() ?? 0) / max(rmsPerBlok.min() ?? 1, 1e-6)
        XCTAssertGreaterThan(verhouding, 1.5, "geen golfbeweging meer na 9 minuten (verhouding \(verhouding))")
    }
}
