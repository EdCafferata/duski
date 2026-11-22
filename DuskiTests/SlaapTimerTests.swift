import XCTest
@testable import Duski

final class SlaapTimerTests: XCTestCase {
    func testAltijdAanZetTimerActiefZonderAftelling() {
        let timer = SlaapTimer()
        timer.startAltijdAan()
        XCTAssertTrue(timer.isAltijdAan)
        XCTAssertTrue(timer.isActief)
        XCTAssertNil(timer.resterendeSeconden, "Altijd aan telt niet af")
        timer.stop()
        XCTAssertFalse(timer.isAltijdAan)
        XCTAssertFalse(timer.isActief)
    }

    func testTimerStartMetJuisteAantalSeconden() {
        let timer = SlaapTimer()
        let mixer = GeluidsMixer()
        timer.start(minuten: 15, mixer: mixer)
        XCTAssertEqual(timer.resterendeSeconden, 15 * 60)
        XCTAssertFalse(timer.isAltijdAan)
        timer.stop()
        XCTAssertNil(timer.resterendeSeconden)
    }

    func testAltijdAanVervangtLopendeTimer() {
        let timer = SlaapTimer()
        timer.start(minuten: 30, mixer: GeluidsMixer())
        timer.startAltijdAan()
        XCTAssertNil(timer.resterendeSeconden)
        XCTAssertTrue(timer.isAltijdAan)
        timer.stop()
    }
}
