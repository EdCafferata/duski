import Foundation

/// Product-ID's zoals aangemaakt in Configuration.storekit (lokaal testen) en
/// straks in App Store Connect (echte prijzen per land, laagste toegestane
/// tier — zie onderzoek/00_PRODUCTCONCEPT.md).
///
/// Let op: zodra de app een definitieve naam heeft, moeten deze ID's + de
/// bundle-ID overal consistent worden hernoemd vóórdat het product in App
/// Store Connect wordt aangemaakt (product-ID's zijn daarna niet meer te wijzigen).
enum AbonnementProductID {
    static let premiumMaandelijks = "info.cafferata.slaapapp.premium.maandelijks"

    static let alle: [String] = [premiumMaandelijks]
}
