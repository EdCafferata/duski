import Foundation

/// Alleen in Debug: launch-argumenten om de app in een bepaalde toestand te starten
/// voor App Store-screenshots via `simctl launch`, zonder UI-automatisering.
/// Voorbeeld: `-demoVoorJou YES`, `-demoGeluid regen`, `-demoTimer 30`, `-demoScreensaver schaapjes`.
/// In een Release-build doen ze niets (geen verborgen functies).
enum Demo {
    static func tekst(_ sleutel: String) -> String? {
        #if DEBUG
        UserDefaults.standard.string(forKey: sleutel)
        #else
        nil
        #endif
    }

    static func aan(_ sleutel: String) -> Bool {
        #if DEBUG
        UserDefaults.standard.bool(forKey: sleutel)
        #else
        false
        #endif
    }
}
