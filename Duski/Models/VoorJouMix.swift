import Foundation

/// De kant-en-klare "Voor jou"-mix bovenaan het hoofdscherm: één tik en er speelt
/// meteen iets dat past bij de leeftijdsgroep. Deze mix is altijd gratis, ook als
/// er premium-lagen in zitten (verbeterplan nov 2026, fase 2).
struct VoorJouMix {
    struct Laag {
        let id: String
        let volume: Float
    }

    let titel: String
    let uitleg: String
    let emoji: String
    let lagen: [Laag]

    var laagIDs: Set<String> { Set(lagen.map(\.id)) }

    static func voor(_ groep: LeeftijdsGroep) -> VoorJouMix {
        switch groep {
        case .baby:
            return VoorJouMix(
                titel: String(localized: "Baarmoeder en sussen"),
                uitleg: String(localized: "Klinkt zoals in de buik. Rustgevend voor pasgeborenen."),
                emoji: "🤰",
                lagen: [Laag(id: "baarmoeder", volume: 0.6), Laag(id: "sussen", volume: 0.3)])
        case .kind:
            return VoorJouMix(
                titel: String(localized: "Speeldoos en zachte regen"),
                uitleg: String(localized: "Bekende slaapliedjes op een speeldoos, met regen op de achtergrond."),
                emoji: "🎠",
                lagen: [Laag(id: "speeldoos", volume: 0.6), Laag(id: "regen", volume: 0.25)])
        case .tiener:
            return VoorJouMix(
                titel: String(localized: "Bruine ruis en regen"),
                uitleg: String(localized: "Diep en rustig. Ook fijn om je te concentreren."),
                emoji: "🟤",
                lagen: [Laag(id: "bruin", volume: 0.6), Laag(id: "regen", volume: 0.3)])
        case .volwassene:
            return VoorJouMix(
                titel: String(localized: "Onweer in de verte"),
                uitleg: String(localized: "Regen met af en toe zacht gerommel. Een van de meest gekozen slaapgeluiden."),
                emoji: "⛈️",
                lagen: [Laag(id: "onweer", volume: 0.7), Laag(id: "bruin", volume: 0.2)])
        case .oudere:
            return VoorJouMix(
                titel: String(localized: "Clair de Lune en zachte regen"),
                uitleg: String(localized: "Langzame klassieke muziek helpt veel ouderen beter te slapen."),
                emoji: "🌙",
                lagen: [Laag(id: "clairdelune", volume: 0.7), Laag(id: "regen", volume: 0.2)])
        }
    }
}
