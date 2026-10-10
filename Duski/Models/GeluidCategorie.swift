import Foundation

/// De geluidscategorieën uit onderzoek/02_muziek_en_geluidscategorieen.md,
/// gegroepeerd zoals bij de meeste succesvolle slaap-apps (Noisli, BetterSleep):
/// losse geluidslagen die je samen kan mixen, elk met eigen volume.
enum GeluidCategorie: String, CaseIterable, Codable, Identifiable {
    case kleurruis
    case natuur
    case lichaam
    case overige

    var id: String { rawValue }

    var titel: String {
        switch self {
        case .kleurruis: return String(localized: "Ruis")
        case .natuur: return String(localized: "Natuur")
        case .lichaam: return String(localized: "Lichaam & baby")
        case .overige: return String(localized: "Overige")
        }
    }

    var opties: [GeluidOptie] {
        switch self {
        case .kleurruis:
            return [
                GeluidOptie(id: "wit", titel: String(localized: "Witte ruis"), emoji: "📻", type: .ruis(.wit), isPremium: false),
                GeluidOptie(id: "roze", titel: String(localized: "Roze ruis"), emoji: "🌸", type: .ruis(.roze), isPremium: true),
                GeluidOptie(id: "bruin", titel: String(localized: "Bruine ruis"), emoji: "🟤", type: .ruis(.bruin), isPremium: true),
                GeluidOptie(id: "grijs", titel: String(localized: "Grijze ruis"), emoji: "🩶", type: .ruis(.grijs), isPremium: true),
                GeluidOptie(id: "blauw", titel: String(localized: "Blauwe ruis"), emoji: "🔵", type: .ruis(.blauw), isPremium: true),
            ]
        case .natuur:
            return [
                GeluidOptie(id: "regen", titel: String(localized: "Regen"), emoji: "🌧️", type: .regen, isPremium: false),
                GeluidOptie(id: "golven", titel: String(localized: "Golven"), emoji: "🌊", type: .golven, isPremium: true),
                GeluidOptie(id: "wind", titel: String(localized: "Wind"), emoji: "🍃", type: .wind, isPremium: true),
                GeluidOptie(id: "vuur", titel: String(localized: "Kampvuur"), emoji: "🔥", type: .vuur, isPremium: true),
                GeluidOptie(id: "beek", titel: String(localized: "Beek"), emoji: "🏞️", type: .beek, isPremium: true),
            ]
        case .lichaam:
            return [
                GeluidOptie(id: "hartslag", titel: String(localized: "Hartslag"), emoji: "❤️", type: .hartslag, isPremium: false),
                GeluidOptie(id: "baarmoeder", titel: String(localized: "Baarmoedergeluiden"), emoji: "🤰", type: .baarmoeder, isPremium: true),
                GeluidOptie(id: "ademhaling", titel: String(localized: "Ademhaling"), emoji: "🫁", type: .ademhaling, isPremium: true),
                GeluidOptie(id: "sussen", titel: String(localized: "Sussen (shhh)"), emoji: "🤫", type: .sussen, isPremium: true),
                GeluidOptie(id: "fohn", titel: String(localized: "Föhn"), emoji: "💨", type: .fohn, isPremium: true),
            ]
        case .overige:
            return [
                GeluidOptie(id: "klankschaal", titel: String(localized: "Klankschaal"), emoji: "🎐", type: .klankschaal, isPremium: false),
                GeluidOptie(id: "ventilator", titel: String(localized: "Ventilator"), emoji: "🌀", type: .ventilator, isPremium: true),
                GeluidOptie(id: "trein", titel: String(localized: "Trein"), emoji: "🚂", type: .trein, isPremium: true),
                GeluidOptie(id: "klok", titel: String(localized: "Tikkende klok"), emoji: "🕰️", type: .klok, isPremium: true),
                GeluidOptie(id: "vliegtuigcabine", titel: String(localized: "Vliegtuigcabine"), emoji: "✈️", type: .vliegtuigcabine, isPremium: true),
                GeluidOptie(id: "autorijden", titel: String(localized: "Autorijden"), emoji: "🚗", type: .autorijden, isPremium: true),
                GeluidOptie(id: "bachprelude", titel: String(localized: "Bach – Prelude in C"), emoji: "🎹", type: .bachPrelude, isPremium: true),
                GeluidOptie(id: "bachair", titel: String(localized: "Bach – Air"), emoji: "🎻", type: .bachAir, isPremium: true),
                GeluidOptie(id: "canon", titel: String(localized: "Pachelbel – Canon in D"), emoji: "🎼", type: .canon, isPremium: true),
                GeluidOptie(id: "gymnopedie", titel: String(localized: "Satie – Gymnopédie"), emoji: "🎶", type: .gymnopedie, isPremium: true),
                GeluidOptie(id: "clairdelune", titel: String(localized: "Debussy – Clair de Lune"), emoji: "🌙", type: .clairDeLune, isPremium: true),
            ]
        }
    }

    /// Hoeveel geluiden in deze categorie premium zijn — gebruikt voor de
    /// slotjes-teller op de paywall.
    var aantalPremiumOpties: Int { opties.filter(\.isPremium).count }
}

/// Eén losse, mixbare geluidslaag. `isPremium` bepaalt of het abonnement nodig
/// is: per categorie is precies één geluid altijd gratis (de instap), de rest
/// zit achter Premium — zie onderzoek/00_PRODUCTCONCEPT.md, sectie Pricing.
struct GeluidOptie: Identifiable, Codable, Hashable {
    let id: String
    let titel: String
    let emoji: String
    let type: GeluidType
    let isPremium: Bool
}

enum GeluidType: Codable, Hashable {
    case ruis(RuisKleur)
    case regen
    case golven
    case wind
    case vuur
    case beek
    case hartslag
    case baarmoeder
    case ademhaling
    case sussen
    case fohn
    case klankschaal
    case ventilator
    case trein
    case klok
    case vliegtuigcabine
    case autorijden
    case bachPrelude
    case bachAir
    case canon
    case gymnopedie
    case clairDeLune
}

enum RuisKleur: String, Codable {
    case wit, roze, bruin, grijs, blauw
}
