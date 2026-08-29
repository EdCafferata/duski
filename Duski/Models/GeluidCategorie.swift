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
        case .kleurruis: return "Ruis"
        case .natuur: return "Natuur"
        case .lichaam: return "Lichaam & baby"
        case .overige: return "Overige"
        }
    }

    var opties: [GeluidOptie] {
        switch self {
        case .kleurruis:
            return [
                GeluidOptie(id: "wit", titel: "Witte ruis", emoji: "📻", type: .ruis(.wit), isPremium: false),
                GeluidOptie(id: "roze", titel: "Roze ruis", emoji: "🌸", type: .ruis(.roze), isPremium: true),
                GeluidOptie(id: "bruin", titel: "Bruine ruis", emoji: "🟤", type: .ruis(.bruin), isPremium: true),
                GeluidOptie(id: "grijs", titel: "Grijze ruis", emoji: "🩶", type: .ruis(.grijs), isPremium: true),
                GeluidOptie(id: "blauw", titel: "Blauwe ruis", emoji: "🔵", type: .ruis(.blauw), isPremium: true),
            ]
        case .natuur:
            return [
                GeluidOptie(id: "regen", titel: "Regen", emoji: "🌧️", type: .regen, isPremium: false),
                GeluidOptie(id: "golven", titel: "Golven", emoji: "🌊", type: .golven, isPremium: true),
                GeluidOptie(id: "wind", titel: "Wind", emoji: "🍃", type: .wind, isPremium: true),
                GeluidOptie(id: "vuur", titel: "Kampvuur", emoji: "🔥", type: .vuur, isPremium: true),
                GeluidOptie(id: "beek", titel: "Beek", emoji: "🏞️", type: .beek, isPremium: true),
            ]
        case .lichaam:
            return [
                GeluidOptie(id: "hartslag", titel: "Hartslag", emoji: "❤️", type: .hartslag, isPremium: false),
                GeluidOptie(id: "baarmoeder", titel: "Baarmoedergeluiden", emoji: "🤰", type: .baarmoeder, isPremium: true),
                GeluidOptie(id: "ademhaling", titel: "Ademhaling", emoji: "🫁", type: .ademhaling, isPremium: true),
                GeluidOptie(id: "sussen", titel: "Sussen (shhh)", emoji: "🤫", type: .sussen, isPremium: true),
                GeluidOptie(id: "fohn", titel: "Föhn", emoji: "💨", type: .fohn, isPremium: true),
            ]
        case .overige:
            return [
                GeluidOptie(id: "klankschaal", titel: "Klankschaal", emoji: "🎐", type: .klankschaal, isPremium: false),
                GeluidOptie(id: "ventilator", titel: "Ventilator", emoji: "🌀", type: .ventilator, isPremium: true),
                GeluidOptie(id: "trein", titel: "Trein", emoji: "🚂", type: .trein, isPremium: true),
                GeluidOptie(id: "klok", titel: "Tikkende klok", emoji: "🕰️", type: .klok, isPremium: true),
                GeluidOptie(id: "vliegtuigcabine", titel: "Vliegtuigcabine", emoji: "✈️", type: .vliegtuigcabine, isPremium: true),
                GeluidOptie(id: "autorijden", titel: "Autorijden", emoji: "🚗", type: .autorijden, isPremium: true),
                GeluidOptie(id: "bachprelude", titel: "Bach – Prelude in C", emoji: "🎹", type: .bachPrelude, isPremium: true),
                GeluidOptie(id: "bachair", titel: "Bach – Air", emoji: "🎻", type: .bachAir, isPremium: true),
                GeluidOptie(id: "canon", titel: "Pachelbel – Canon in D", emoji: "🎼", type: .canon, isPremium: true),
                GeluidOptie(id: "gymnopedie", titel: "Satie – Gymnopédie", emoji: "🎶", type: .gymnopedie, isPremium: true),
                GeluidOptie(id: "clairdelune", titel: "Debussy – Clair de Lune", emoji: "🌙", type: .clairDeLune, isPremium: true),
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
