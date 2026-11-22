import XCTest
@testable import Duski

/// De geluiden worden sample-voor-sample gegenereerd; deze tests bewaken dat ze
/// binnen het bereik blijven (geen clipping/harde pieken) en niet stil zijn.
final class GeneratorTests: XCTestCase {
    private let sampleRate = 48_000.0

    private func samples(_ g: GeluidGenerator, seconden: Double = 2) -> [Float] {
        (0..<Int(sampleRate * seconden)).map { _ in g.volgendeSample(sampleRate: sampleRate) }
    }

    func testRuisKleurenBlijvenBinnenBereikEnZijnNietStil() {
        for kleur in [RuisKleur.wit, .roze, .bruin, .grijs, .blauw] {
            let s = samples(RuisGenerator(kleur: kleur))
            let piek = s.map(abs).max() ?? 0
            let rms = sqrt(s.map { $0 * $0 }.reduce(0, +) / Float(s.count))
            // Willekeurige ruis piekt heel af en toe net boven 1,0 (bv. grijs ~1,06); de
            // laagvolumes in de mixer dempen dat. Bewaak alleen tegen echte uitschieters.
            XCTAssertLessThanOrEqual(piek, 1.5, "\(kleur) geeft extreme pieken")
            XCTAssertGreaterThan(rms, 0.01, "\(kleur) is (bijna) stil")
        }
    }

    func testAlleGeluidTypesLeverenGeldigeSamples() {
        let alleTypes = GeluidCategorie.allCases.flatMap(\.opties).map(\.type)
        XCTAssertFalse(alleTypes.isEmpty)
        for type in alleTypes {
            let s = samples(GeluidGeneratorFabriek.maak(voor: type), seconden: 1)
            XCTAssertFalse(s.contains { $0.isNaN || $0.isInfinite }, "\(type) geeft NaN/oneindig")
            XCTAssertLessThanOrEqual(s.map(abs).max() ?? 0, 2.0, "\(type) geeft extreme pieken")
        }
    }

    func testHartslagHeeftRustigTempo() {
        // 65 bpm → in 6 seconden ~6,5 hartslagen ("lub-dub"). De "dub" volgt ~0,17 s na de
        // "lub"; tel alleen aanzetten na minstens 0,3 s stilte, dus één per hartslag.
        let s = samples(HartslagGenerator(), seconden: 6)
        var slagen = 0, stil = Int(sampleRate)
        for v in s {
            if abs(v) > 0.3 { if stil > Int(sampleRate * 0.3) { slagen += 1 }; stil = 0 } else { stil += 1 }
        }
        XCTAssertTrue((6...7).contains(slagen), "verwacht 6-7 hartslagen, kreeg \(slagen)")
    }
}
