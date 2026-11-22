import XCTest
@testable import Duski

final class BeoordelingsVerzoekTests: XCTestCase {
    override func setUp() {
        super.setUp()
        for key in ["duski-gebruiksdagen", "duski-geslaagde-sessie", "duski-beoordeling-gevraagd-versie"] {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }

    private func dag(_ n: Int) -> Date { Date(timeIntervalSince1970: 1_800_000_000 + Double(n) * 86_400) }

    func testVraagtPasNaDrieDagenEnEenGeslaagdeSessie() {
        BeoordelingsVerzoek.registreerAppStart(vandaag: dag(0))
        BeoordelingsVerzoek.registreerAppStart(vandaag: dag(1))
        BeoordelingsVerzoek.registreerGeslaagdeSessie()
        XCTAssertFalse(BeoordelingsVerzoek.magVragen, "pas op de derde gebruiksdag")
        BeoordelingsVerzoek.registreerAppStart(vandaag: dag(2))
        XCTAssertTrue(BeoordelingsVerzoek.magVragen)
    }

    func testZonderGeslaagdeSessieGeenVraag() {
        (0..<5).forEach { BeoordelingsVerzoek.registreerAppStart(vandaag: dag($0)) }
        XCTAssertFalse(BeoordelingsVerzoek.magVragen)
    }

    func testMaarEenKeerPerVersie() {
        (0..<3).forEach { BeoordelingsVerzoek.registreerAppStart(vandaag: dag($0)) }
        BeoordelingsVerzoek.registreerGeslaagdeSessie()
        XCTAssertTrue(BeoordelingsVerzoek.magVragen)
        BeoordelingsVerzoek.markeerGevraagd()
        BeoordelingsVerzoek.registreerGeslaagdeSessie()
        XCTAssertFalse(BeoordelingsVerzoek.magVragen)
    }
}
