import SwiftUI

/// Eén kiesbare screensaver-animatie binnen een categorie.
struct ScreensaverOptie: Identifiable, Hashable {
    let id: String
    let titel: String
    let emoji: String
    let type: ScreensaverType
}

enum ScreensaverType: Hashable {
    case animatie(ScreensaverConfig)
    case schaapjesTellen
}

/// Bepaalt hoe een screensaver-animatie beweegt en oogt — puur SwiftUI-
/// animatie (TimelineView + emoji), geen video- of mediabestanden van derden
/// nodig (zelfde rechtenvrije aanpak als de audio-generators).
struct ScreensaverConfig: Hashable {
    let elementEmoji: String
    let achtergrondBoven: Color
    let achtergrondOnder: Color
    let beweging: ScreensaverBeweging
    let aantalElementen: Int
    let snelheid: Double
}

enum ScreensaverBeweging: Hashable {
    case glijdenZijwaarts
    case vallenOmlaag
    case drijvenOmhoog
    case twinkelen
    case deinen
}
