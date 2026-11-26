import XCTest
@testable import Duski

final class VoorJouMixTests: XCTestCase {
    func testElkeGroepHeeftEenMixMetBestaandeGeluiden() {
        for groep in LeeftijdsGroep.allCases {
            let mix = VoorJouMix.voor(groep)
            XCTAssertFalse(mix.lagen.isEmpty, "\(groep) heeft geen lagen")
            for laag in mix.lagen {
                XCTAssertNotNil(GeluidCategorie.optie(id: laag.id), "\(groep): onbekend geluid \(laag.id)")
            }
        }
    }

    func testOuderenKrijgenKlassiek() {
        XCTAssertTrue(VoorJouMix.voor(.oudere).laagIDs.contains("clairdelune"))
    }

    /// De nieuwe geluiden moeten hoorbaar zijn maar nooit clippen (over 60 s, met minstens één donderslag).
    func testNieuweGeluidenZijnHoorbaarEnClippenNiet() {
        let sampleRate = 48_000.0
        let generators: [(String, GeluidGenerator)] = [
            ("onweer", OnweerGenerator()), ("stofzuiger", StofzuigerGenerator()), ("speeldoos", SpeeldoosGenerator()),
        ]
        for (naam, g) in generators {
            var som: Float = 0, piek: Float = 0
            let n = Int(sampleRate * 60)
            for _ in 0..<n {
                let v = g.volgendeSample(sampleRate: sampleRate)
                XCTAssertFalse(v.isNaN, naam)
                som += v * v; piek = max(piek, abs(v))
            }
            let rms = sqrt(som / Float(n))
            XCTAssertGreaterThan(rms, 0.02, "\(naam) is te zacht (rms \(rms))")
            XCTAssertLessThan(piek, 0.98, "\(naam) clipt (piek \(piek))")
            print("\(naam): rms \(rms), piek \(piek)")
        }
    }
}
