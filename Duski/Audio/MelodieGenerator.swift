import Foundation

/// Eén losse muzieknoot binnen een melodie: frequentie in Hz (0 = rust/stilte)
/// en duur in tellen (kwartnoot = 1.0).
struct MelodieNoot {
    let frequentie: Double
    let tellen: Double
}

/// Speelt een vaste reeks noten af als zachte, ronde sinustonen (grondtoon +
/// zwakke boventoon) — eigen additieve synthese, geen samples of opnames van
/// derden. Basis voor arrangementen geïnspireerd op allang auteursrechtvrije
/// klassieke stukken (componist meer dan 70 jaar overleden), zoals Bach,
/// Pachelbel, Satie en Debussy.
class MelodieGenerator: GeluidGenerator {
    private let noten: [MelodieNoot]
    private let tempoBpm: Double
    private var notenIndex = 0
    private var tijdInNoot: Double = 0
    private var fase: Double = 0

    init(noten: [MelodieNoot], tempoBpm: Double) {
        self.noten = noten
        self.tempoBpm = tempoBpm
    }

    func volgendeSample(sampleRate: Double) -> Float {
        guard !noten.isEmpty else { return 0 }
        let dt = 1.0 / sampleRate
        let secondenPerTel = 60.0 / tempoBpm

        var noot = noten[notenIndex]
        var duur = noot.tellen * secondenPerTel

        tijdInNoot += dt
        if tijdInNoot >= duur {
            tijdInNoot -= duur
            notenIndex = (notenIndex + 1) % noten.count
            noot = noten[notenIndex]
            duur = noot.tellen * secondenPerTel
        }

        let attack = min(tijdInNoot / 0.05, 1.0)
        let release = min((duur - tijdInNoot) / max(duur * 0.6, 0.001), 1.0)
        let envelope = min(attack, release)

        guard noot.frequentie > 0 else { return 0 }
        fase += noot.frequentie * dt
        if fase > 1 { fase -= 1 }

        let grondtoon = sin(2 * .pi * fase)
        let boventoon = sin(2 * .pi * fase * 2) * 0.25
        return Float((grondtoon + boventoon) * envelope * 0.18)
    }
}
