import Foundation

/// Bepaalt wanneer Duski om een App Store-beoordeling mag vragen: pas bij een
/// volgende app-start ná een geslaagde sessie (sleeptimer afgelopen of minstens
/// 20 minuten geluid), op z'n vroegst de derde gebruiksdag, en hooguit één keer
/// per app-versie. Nooit tijdens het inslapen zelf. Apple begrenst het tonen
/// daarnaast zelf (max. 3× per 365 dagen).
enum BeoordelingsVerzoek {
    private static let dagenKey = "duski-gebruiksdagen"
    private static let sessieKey = "duski-geslaagde-sessie"
    private static let versieKey = "duski-beoordeling-gevraagd-versie"
    private static let minimaleDagen = 3

    /// Minuten ononderbroken geluid die als geslaagde sessie tellen.
    static let minutenVoorGeslaagdeSessie = 20

    private static var huidigeVersie: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }

    /// Aanroepen bij elke app-start: telt unieke gebruiksdagen.
    static func registreerAppStart(vandaag: Date = .now) {
        let dag = vandaag.formatted(.iso8601.year().month().day())
        var dagen = UserDefaults.standard.stringArray(forKey: dagenKey) ?? []
        guard !dagen.contains(dag) else { return }
        dagen.append(dag)
        UserDefaults.standard.set(Array(dagen.suffix(minimaleDagen)), forKey: dagenKey)
    }

    static func registreerGeslaagdeSessie() {
        UserDefaults.standard.set(true, forKey: sessieKey)
    }

    static var magVragen: Bool {
        let dagen = UserDefaults.standard.stringArray(forKey: dagenKey) ?? []
        return dagen.count >= minimaleDagen
            && UserDefaults.standard.bool(forKey: sessieKey)
            && UserDefaults.standard.string(forKey: versieKey) != huidigeVersie
    }

    static func markeerGevraagd() {
        UserDefaults.standard.set(huidigeVersie, forKey: versieKey)
        UserDefaults.standard.set(false, forKey: sessieKey)
    }
}
