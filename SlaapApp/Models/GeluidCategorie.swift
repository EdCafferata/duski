import Foundation

/// De geluidscategorieën uit onderzoek/02_muziek_en_geluidscategorieen.md,
/// gegroepeerd zoals bij de meeste succesvolle slaap-apps (Noisli, BetterSleep):
/// losse geluidslagen die je samen kan mixen, elk met eigen volume.
enum GeluidCategorie: String, CaseIterable, Codable, Identifiable {
    case kleurruis
    case natuur
    case lichaam
    case meditatie

    var id: String { rawValue }

    var titel: String {
        switch self {
        case .kleurruis: return "Ruis"
        case .natuur: return "Natuur"
        case .lichaam: return "Lichaam & baby"
        case .meditatie: return "Meditatie"
        }
    }

    var opties: [GeluidOptie] {
        switch self {
        case .kleurruis:
            return [
                GeluidOptie(id: "wit", titel: "Witte ruis", emoji: "📻", type: .ruis(.wit)),
                GeluidOptie(id: "roze", titel: "Roze ruis", emoji: "🌸", type: .ruis(.roze)),
                GeluidOptie(id: "bruin", titel: "Bruine ruis", emoji: "🟤", type: .ruis(.bruin)),
            ]
        case .natuur:
            return [
                GeluidOptie(id: "regen", titel: "Regen", emoji: "🌧️", type: .regen),
                GeluidOptie(id: "golven", titel: "Golven", emoji: "🌊", type: .golven),
            ]
        case .lichaam:
            return [
                GeluidOptie(id: "hartslag", titel: "Hartslag", emoji: "❤️", type: .hartslag),
                GeluidOptie(id: "baarmoeder", titel: "Baarmoedergeluiden", emoji: "🤰", type: .baarmoeder),
            ]
        case .meditatie:
            return [
                GeluidOptie(id: "klankschaal", titel: "Klankschaal", emoji: "🎐", type: .klankschaal),
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
    case hartslag
    case baarmoeder
    case klankschaal
}

enum RuisKleur: String, Codable {
    case wit, roze, bruin
}
