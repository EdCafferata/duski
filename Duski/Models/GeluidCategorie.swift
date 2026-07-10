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
                GeluidOptie(id: "wit", titel: "Witte ruis", emoji: "📻", type: .ruis(.wit)),
                GeluidOptie(id: "roze", titel: "Roze ruis", emoji: "🌸", type: .ruis(.roze)),
                GeluidOptie(id: "bruin", titel: "Bruine ruis", emoji: "🟤", type: .ruis(.bruin)),
                GeluidOptie(id: "grijs", titel: "Grijze ruis", emoji: "🩶", type: .ruis(.grijs)),
                GeluidOptie(id: "blauw", titel: "Blauwe ruis", emoji: "🔵", type: .ruis(.blauw)),
            ]
        case .natuur:
            return [
                GeluidOptie(id: "regen", titel: "Regen", emoji: "🌧️", type: .regen),
                GeluidOptie(id: "golven", titel: "Golven", emoji: "🌊", type: .golven),
                GeluidOptie(id: "wind", titel: "Wind", emoji: "🍃", type: .wind),
                GeluidOptie(id: "vuur", titel: "Kampvuur", emoji: "🔥", type: .vuur),
                GeluidOptie(id: "beek", titel: "Beek", emoji: "🏞️", type: .beek),
            ]
        case .lichaam:
            return [
                GeluidOptie(id: "hartslag", titel: "Hartslag", emoji: "❤️", type: .hartslag),
                GeluidOptie(id: "baarmoeder", titel: "Baarmoedergeluiden", emoji: "🤰", type: .baarmoeder),
                GeluidOptie(id: "ademhaling", titel: "Ademhaling", emoji: "🫁", type: .ademhaling),
                GeluidOptie(id: "sussen", titel: "Sussen (shhh)", emoji: "🤫", type: .sussen),
                GeluidOptie(id: "fohn", titel: "Föhn", emoji: "💨", type: .fohn),
            ]
        case .overige:
            return [
                GeluidOptie(id: "klankschaal", titel: "Klankschaal", emoji: "🎐", type: .klankschaal),
                GeluidOptie(id: "ventilator", titel: "Ventilator", emoji: "🌀", type: .ventilator),
                GeluidOptie(id: "trein", titel: "Trein", emoji: "🚂", type: .trein),
                GeluidOptie(id: "klok", titel: "Tikkende klok", emoji: "🕰️", type: .klok),
                GeluidOptie(id: "vliegtuigcabine", titel: "Vliegtuigcabine", emoji: "✈️", type: .vliegtuigcabine),
                GeluidOptie(id: "autorijden", titel: "Autorijden", emoji: "🚗", type: .autorijden),
                GeluidOptie(id: "bachprelude", titel: "Bach – Prelude in C", emoji: "🎹", type: .bachPrelude),
                GeluidOptie(id: "bachair", titel: "Bach – Air", emoji: "🎻", type: .bachAir),
                GeluidOptie(id: "canon", titel: "Pachelbel – Canon in D", emoji: "🎼", type: .canon),
                GeluidOptie(id: "gymnopedie", titel: "Satie – Gymnopédie", emoji: "🎶", type: .gymnopedie),
                GeluidOptie(id: "clairdelune", titel: "Debussy – Clair de Lune", emoji: "🌙", type: .clairDeLune),
            ]
        }
    }
}

/// Eén losse, mixbare geluidslaag.
struct GeluidOptie: Identifiable, Codable, Hashable {
    let id: String
    let titel: String
    let emoji: String
    let type: GeluidType
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
