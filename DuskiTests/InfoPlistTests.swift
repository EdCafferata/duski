import XCTest
@testable import Duski

/// Regressietest: zonder UIBackgroundModes=audio stopt iOS het geluid zodra het scherm
/// vergrendelt (gebeurde t/m 1.3 build 9: INFOPLIST_KEY_UIBackgroundModes werd niet
/// in de gegenereerde Info.plist gezet).
final class InfoPlistTests: XCTestCase {
    func testAchtergrondaudioStaatAan() {
        let modes = Bundle(for: GeluidsMixer.self).object(forInfoDictionaryKey: "UIBackgroundModes") as? [String] ?? []
        XCTAssertTrue(modes.contains("audio"), "UIBackgroundModes mist 'audio' — geluid stopt bij vergrendelen")
    }
}
