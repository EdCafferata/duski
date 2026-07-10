import SwiftUI

/// Screensaver-opties per geluidscategorie — elke categorie krijgt een eigen,
/// herkenbare set animaties die aansluiten bij de geluiden erin.
extension GeluidCategorie {
    var screensaverOpties: [ScreensaverOptie] {
        switch self {
        case .kleurruis:
            return [
                ScreensaverOptie(id: "tv-sneeuw", titel: "Tv-sneeuw", emoji: "📺", type: .animatie(ScreensaverConfig(
                    elementEmoji: "▫️",
                    achtergrondBoven: Color(white: 0.15), achtergrondOnder: Color(white: 0.05),
                    beweging: .twinkelen, aantalElementen: 40, snelheid: 30
                ))),
                ScreensaverOptie(id: "bloesem", titel: "Bloesem", emoji: "🌸", type: .animatie(ScreensaverConfig(
                    elementEmoji: "🌸",
                    achtergrondBoven: Color(red: 0.30, green: 0.10, blue: 0.20), achtergrondOnder: Color(red: 0.08, green: 0.03, blue: 0.08),
                    beweging: .drijvenOmhoog, aantalElementen: 14, snelheid: 8
                ))),
                ScreensaverOptie(id: "aarde", titel: "Aarde", emoji: "🟤", type: .animatie(ScreensaverConfig(
                    elementEmoji: "🟤",
                    achtergrondBoven: Color(red: 0.20, green: 0.13, blue: 0.06), achtergrondOnder: Color(red: 0.06, green: 0.04, blue: 0.02),
                    beweging: .deinen, aantalElementen: 12, snelheid: 6
                ))),
                ScreensaverOptie(id: "mist", titel: "Mist", emoji: "🌫️", type: .animatie(ScreensaverConfig(
                    elementEmoji: "🌫️",
                    achtergrondBoven: Color(white: 0.22), achtergrondOnder: Color(white: 0.06),
                    beweging: .glijdenZijwaarts, aantalElementen: 10, snelheid: 12
                ))),
                ScreensaverOptie(id: "bubbels", titel: "Bubbels", emoji: "🔵", type: .animatie(ScreensaverConfig(
                    elementEmoji: "🔵",
                    achtergrondBoven: Color(red: 0.05, green: 0.10, blue: 0.30), achtergrondOnder: Color(red: 0.02, green: 0.03, blue: 0.10),
                    beweging: .drijvenOmhoog, aantalElementen: 18, snelheid: 10
                ))),
            ]
        case .natuur:
            return [
                ScreensaverOptie(id: "regen", titel: "Regen", emoji: "🌧️", type: .animatie(ScreensaverConfig(
                    elementEmoji: "💧",
                    achtergrondBoven: Color(red: 0.08, green: 0.12, blue: 0.18), achtergrondOnder: Color(red: 0.02, green: 0.03, blue: 0.06),
                    beweging: .vallenOmlaag, aantalElementen: 30, snelheid: 1.2
                ))),
                ScreensaverOptie(id: "golven", titel: "Golven", emoji: "🌊", type: .animatie(ScreensaverConfig(
                    elementEmoji: "🌊",
                    achtergrondBoven: Color(red: 0.04, green: 0.18, blue: 0.28), achtergrondOnder: Color(red: 0.01, green: 0.05, blue: 0.10),
                    beweging: .deinen, aantalElementen: 8, snelheid: 5
                ))),
                ScreensaverOptie(id: "wind", titel: "Wind", emoji: "🍃", type: .animatie(ScreensaverConfig(
                    elementEmoji: "🍃",
                    achtergrondBoven: Color(red: 0.10, green: 0.20, blue: 0.14), achtergrondOnder: Color(red: 0.03, green: 0.06, blue: 0.04),
                    beweging: .glijdenZijwaarts, aantalElementen: 14, snelheid: 26
                ))),
                ScreensaverOptie(id: "kampvuur", titel: "Kampvuur", emoji: "🔥", type: .animatie(ScreensaverConfig(
                    elementEmoji: "✨",
                    achtergrondBoven: Color(red: 0.20, green: 0.08, blue: 0.02), achtergrondOnder: Color(red: 0.05, green: 0.02, blue: 0.01),
                    beweging: .drijvenOmhoog, aantalElementen: 16, snelheid: 16
                ))),
                ScreensaverOptie(id: "beek", titel: "Beek", emoji: "🏞️", type: .animatie(ScreensaverConfig(
                    elementEmoji: "💧",
                    achtergrondBoven: Color(red: 0.06, green: 0.16, blue: 0.18), achtergrondOnder: Color(red: 0.02, green: 0.05, blue: 0.06),
                    beweging: .glijdenZijwaarts, aantalElementen: 12, snelheid: 34
                ))),
            ]
        case .lichaam:
            return [
                ScreensaverOptie(id: "hartslag", titel: "Hartslag", emoji: "❤️", type: .animatie(ScreensaverConfig(
                    elementEmoji: "❤️",
                    achtergrondBoven: Color(red: 0.20, green: 0.03, blue: 0.06), achtergrondOnder: Color(red: 0.05, green: 0.01, blue: 0.02),
                    beweging: .twinkelen, aantalElementen: 1, snelheid: 20
                ))),
                ScreensaverOptie(id: "geborgenheid", titel: "Geborgenheid", emoji: "🤰", type: .animatie(ScreensaverConfig(
                    elementEmoji: "🌕",
                    achtergrondBoven: Color(red: 0.18, green: 0.10, blue: 0.05), achtergrondOnder: Color(red: 0.06, green: 0.03, blue: 0.02),
                    beweging: .deinen, aantalElementen: 1, snelheid: 4
                ))),
                ScreensaverOptie(id: "ademhaling", titel: "Ademhaling", emoji: "🫁", type: .animatie(ScreensaverConfig(
                    elementEmoji: "⚪️",
                    achtergrondBoven: Color(red: 0.06, green: 0.12, blue: 0.16), achtergrondOnder: Color(red: 0.02, green: 0.04, blue: 0.06),
                    beweging: .twinkelen, aantalElementen: 1, snelheid: 6
                ))),
                ScreensaverOptie(id: "sussen", titel: "Sussen", emoji: "🤫", type: .animatie(ScreensaverConfig(
                    elementEmoji: "💤",
                    achtergrondBoven: Color(red: 0.10, green: 0.10, blue: 0.20), achtergrondOnder: Color(red: 0.03, green: 0.03, blue: 0.08),
                    beweging: .deinen, aantalElementen: 6, snelheid: 5
                ))),
                ScreensaverOptie(id: "luchtstroom", titel: "Luchtstroom", emoji: "💨", type: .animatie(ScreensaverConfig(
                    elementEmoji: "💨",
                    achtergrondBoven: Color(white: 0.18), achtergrondOnder: Color(white: 0.05),
                    beweging: .glijdenZijwaarts, aantalElementen: 10, snelheid: 40
                ))),
            ]
        case .overige:
            return [
                ScreensaverOptie(id: "schaapjes", titel: "Schaapjes tellen", emoji: "🐑", type: .schaapjesTellen),
                ScreensaverOptie(id: "sterrenhemel", titel: "Sterrenhemel", emoji: "✨", type: .animatie(ScreensaverConfig(
                    elementEmoji: "✨",
                    achtergrondBoven: Color(red: 0.04, green: 0.04, blue: 0.14), achtergrondOnder: Color(red: 0.01, green: 0.01, blue: 0.04),
                    beweging: .twinkelen, aantalElementen: 40, snelheid: 20
                ))),
                ScreensaverOptie(id: "kaarsvlam", titel: "Kaarsvlam", emoji: "🕯️", type: .animatie(ScreensaverConfig(
                    elementEmoji: "🕯️",
                    achtergrondBoven: Color(red: 0.14, green: 0.08, blue: 0.02), achtergrondOnder: Color(red: 0.03, green: 0.02, blue: 0.01),
                    beweging: .deinen, aantalElementen: 1, snelheid: 3
                ))),
                ScreensaverOptie(id: "treinraam", titel: "Treinraam", emoji: "🚂", type: .animatie(ScreensaverConfig(
                    elementEmoji: "🌲",
                    achtergrondBoven: Color(red: 0.06, green: 0.10, blue: 0.16), achtergrondOnder: Color(red: 0.02, green: 0.03, blue: 0.05),
                    beweging: .glijdenZijwaarts, aantalElementen: 10, snelheid: 60
                ))),
                ScreensaverOptie(id: "wolkendek", titel: "Wolkendek", emoji: "✈️", type: .animatie(ScreensaverConfig(
                    elementEmoji: "☁️",
                    achtergrondBoven: Color(red: 0.30, green: 0.45, blue: 0.65), achtergrondOnder: Color(red: 0.08, green: 0.14, blue: 0.24),
                    beweging: .glijdenZijwaarts, aantalElementen: 8, snelheid: 14
                ))),
            ]
        }
    }
}
