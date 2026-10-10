import StoreKit

/// Paywall-teksten per abonnementsproduct. Guideline 3.1.2(c): naam, looptijd,
/// prijs en verlengingsvoorwaarden moeten in de koopflow zichtbaar zijn — per
/// looptijd (maand/jaar) een eigen, volledig vertaalbare zin.
extension Product {
    var isJaarabonnement: Bool {
        subscription?.subscriptionPeriod.unit == .year
    }

    /// Bv. "1 jaar — € 9,99 per jaar".
    var looptijdEnPrijs: String {
        isJaarabonnement
            ? String(localized: "1 jaar — \(displayPrice) per jaar")
            : String(localized: "1 maand — \(displayPrice) per maand")
    }

    /// Volledige verlengingstekst onder de koopknop.
    var verlengingsTekst: String {
        isJaarabonnement
            ? String(localized: "Het abonnement wordt automatisch elk jaar verlengd tegen \(displayPrice), tenzij je het minstens 24 uur vóór het einde van de lopende periode opzegt via de abonnementsinstellingen van je Apple-account.")
            : String(localized: "Het abonnement wordt automatisch elke maand verlengd tegen \(displayPrice), tenzij je het minstens 24 uur vóór het einde van de lopende periode opzegt via de abonnementsinstellingen van je Apple-account.")
    }

    /// Heeft dit product een gratis proefperiode als introductie-aanbod?
    var heeftGratisProef: Bool {
        subscription?.introductoryOffer?.paymentMode == .freeTrial
    }
}
