import XCTest

/// Rooktest: start de app en controleer dat hij de voorgrond haalt zonder te crashen,
/// en dat de mixer verschijnt na het overslaan van de onboarding.
final class SmokeUITests: XCTestCase {
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    func testAppStartZonderCrash() {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.wait(for: .runningForeground, timeout: 15),
                      "App bereikte de voorgrond niet binnen 15 s — waarschijnlijk een crash bij opstart")
    }

    func testMixerToontSleeptimerEnAltijdAan() {
        let app = XCUIApplication()
        app.launchArguments += ["-duski-leeftijdsgroep", "baby", "-AppleLanguages", "(nl)"]
        app.launch()
        XCTAssertTrue(app.staticTexts["Sleeptimer"].waitForExistence(timeout: 15) || app.swipeUpAndFind("Sleeptimer"))
        XCTAssertTrue(app.buttons["Altijd aan"].exists || app.swipeUpAndFind("Altijd aan", button: true))
    }
}

private extension XCUIApplication {
    func swipeUpAndFind(_ label: String, button: Bool = false) -> Bool {
        for _ in 0..<4 {
            if (button ? buttons[label] : staticTexts[label]).exists { return true }
            swipeUp()
        }
        return (button ? buttons[label] : staticTexts[label]).exists
    }
}
