import Foundation

/// Leeftijdsgroepen zoals onderscheiden in AASM/WHO/Sleep Foundation-richtlijnen
/// (zie onderzoek/01_demografie_wetenschap_appstore.md). Bepaalt welke content en
/// veiligheidsgrenzen (bv. volumelimiet bij Baby) worden getoond.
enum LeeftijdsGroep: String, CaseIterable, Codable, Identifiable {
    case baby
    case kind
    case tienerVolwassene
    case oudere

    var id: String { rawValue }

    var titel: String {
        switch self {
        case .baby: return "Baby (0-1 jaar)"
        case .kind: return "Kind (1-12 jaar)"
        case .tienerVolwassene: return "Tiener / Volwassene"
        case .oudere: return "Oudere (65+)"
        }
    }

    var emoji: String {
        switch self {
        case .baby: return "👶"
        case .kind: return "🧒"
        case .tienerVolwassene: return "🧑"
        case .oudere: return "🧓"
        }
    }

    /// Baby-modus: onderzoek toont dat alle geteste witte-ruismachines op vol volume
    /// de ziekenhuis-veilige geluidsniveaus overschreden — daarom een harde limiet.
    var maximaalVolume: Float {
        self == .baby ? 0.5 : 1.0
    }
}
