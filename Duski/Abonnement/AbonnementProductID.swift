import Foundation

/// Product-ID's zoals aangemaakt in Configuration.storekit (lokaal testen) en
/// in App Store Connect (subscription group "Premium"). Product-ID's zijn na
/// aanmaken niet meer te wijzigen.
enum AbonnementProductID {
    static let premiumMaandelijks = "info.cafferata.duski.premium.maandelijks"
    static let premiumJaarlijks = "info.cafferata.duski.premium.jaarlijks"

    /// Volgorde = volgorde op de paywall: jaar eerst (voordeligst), dan maand.
    static let alle: [String] = [premiumJaarlijks, premiumMaandelijks]
}
