import XCTest

/// Elke UI-tekst moet in alle 8 app-talen vertaald zijn (bron = nl in Localizable.xcstrings).
final class LokalisatieTests: XCTestCase {
    func testAlleTekstenZijnInAlleTalenVertaald() throws {
        let bestand = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent()
            .appendingPathComponent("Duski/Localizable.xcstrings")
        let json = try XCTUnwrap(JSONSerialization.jsonObject(with: Data(contentsOf: bestand)) as? [String: Any])
        let strings = try XCTUnwrap(json["strings"] as? [String: [String: Any]])
        let talen = ["de", "en", "es", "fr", "it", "ja", "pt-BR"]
        var ontbrekend: [String] = []
        for (key, waarde) in strings where (waarde["shouldTranslate"] as? Bool) != false {
            let loc = waarde["localizations"] as? [String: [String: Any]] ?? [:]
            for taal in talen {
                let unit = loc[taal]?["stringUnit"] as? [String: Any]
                if unit?["state"] as? String != "translated" { ontbrekend.append("\(taal): \(key)") }
            }
        }
        XCTAssertTrue(ontbrekend.isEmpty, "Niet vertaald:\n" + ontbrekend.sorted().joined(separator: "\n"))
    }
}
