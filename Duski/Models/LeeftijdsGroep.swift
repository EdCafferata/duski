import Foundation

/// Leeftijdsgroepen zoals onderscheiden in AASM/WHO/Sleep Foundation-richtlijnen
/// (zie onderzoek/01_demografie_wetenschap_appstore.md). Bepaalt welke content en
/// veiligheidsgrenzen (bv. volumelimiet bij Baby) worden getoond.
enum LeeftijdsGroep: String, CaseIterable, Codable, Identifiable {
    case baby
    case kind
    case tiener
    case volwassene
    case oudere

    var id: String { rawValue }

    var titel: String {
        switch self {
        case .baby: return String(localized: "Baby (0-1 jaar)")
        case .kind: return String(localized: "Kind (1-12 jaar)")
        case .tiener: return String(localized: "Tiener (13-17 jaar)")
        case .volwassene: return String(localized: "Volwassene (18-64 jaar)")
        case .oudere: return String(localized: "Oudere (65+ jaar)")
        }
    }

    var emoji: String {
        switch self {
        case .baby: return "👶"
        case .kind: return "🧒"
        case .tiener: return "🧑"
        case .volwassene: return "🧑"
        case .oudere: return "🧓"
        }
    }

    /// Baby-modus: onderzoek toont dat alle geteste witte-ruismachines op vol volume
    /// de ziekenhuis-veilige geluidsniveaus overschreden — daarom een harde limiet.
    var maximaalVolume: Float {
        self == .baby ? 0.5 : 1.0
    }
}
