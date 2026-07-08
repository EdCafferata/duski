import Foundation

/// Bewaart de leeftijdsgroep-keuze (onboarding) in UserDefaults.
enum GebruikersVoorkeuren {
    private static let leeftijdsGroepKey = "duski-leeftijdsgroep"

    static var leeftijdsGroep: LeeftijdsGroep? {
        get {
            guard let waarde = UserDefaults.standard.string(forKey: leeftijdsGroepKey) else { return nil }
            return LeeftijdsGroep(rawValue: waarde)
        }
        set {
            UserDefaults.standard.set(newValue?.rawValue, forKey: leeftijdsGroepKey)
        }
    }

    static var heeftOnboardingGedaan: Bool { leeftijdsGroep != nil }
}
