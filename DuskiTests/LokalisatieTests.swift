import XCTest

/// Elke UI-tekst moet in alle 8 app-talen vertaald zijn (bron = nl in Localizable.xcstrings).
final class LokalisatieTests: XCTestCase {
    func testAlleTekstenZijnInAlleTalenVertaald() throws {
        let bestand = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent()
            .appendingPathComponent("Duski/Localizable.xcstrings")
        // Vanaf een netwerkschijf (NAS) mag de simulator-sandbox de bron niet lezen; dan overslaan.
        guard let data = try? Data(contentsOf: bestand) else {
            throw XCTSkip("Localizable.xcstrings niet leesbaar vanuit de simulator (\(bestand.path))")
        }
        let json = try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
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
