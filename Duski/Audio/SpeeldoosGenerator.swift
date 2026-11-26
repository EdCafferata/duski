import Foundation

/// Speeldoos met slaapliedjes: Brahms' Wiegenlied (Brahms overleed in 1897) en het
/// volksliedje "Altijd is Kortjakje ziek" / "Twinkle Twinkle" — beide allang
/// rechtenvrij. Eigen synthese van een speeldoos-klankje: elke noot is een kort
/// tokkeltje dat vanzelf uitklinkt (grondtoon + zwakke, sneller wegstervende
/// boventonen), en klinkt door onder de volgende noot.
final class SpeeldoosGenerator: GeluidGenerator {
    private struct Stem {
        var frequentie: Double
        var fase: Double = 0
        var leeftijd: Double = 0
    }

    private let noten: [MelodieNoot]
    private let secondenPerTel = 60.0 / 66.0
    private var notenIndex = 0
    private var tijdTotVolgende: Double = 0
    private var stemmen: [Stem] = []

    init() {
        // C5 = 523,25 Hz; alles in C-groot, in het hoge "speeldoos"-register.
        let c5 = 523.25, d5 = 587.33, e5 = 659.25, f5 = 698.46, g5 = 783.99
        let a5 = 880.00, b5 = 987.77, c6 = 1046.50, g4 = 392.00, c4 = 261.63
        let rust = 0.0
        let wiegenlied: [MelodieNoot] = [
            .init(frequentie: e5, tellen: 0.5), .init(frequentie: e5, tellen: 0.5), .init(frequentie: g5, tellen: 2),
            .init(frequentie: e5, tellen: 0.5), .init(frequentie: e5, tellen: 0.5), .init(frequentie: g5, tellen: 2),
            .init(frequentie: e5, tellen: 0.5), .init(frequentie: g5, tellen: 0.5), .init(frequentie: c6, tellen: 1),
            .init(frequentie: b5, tellen: 1.5), .init(frequentie: a5, tellen: 0.5), .init(frequentie: a5, tellen: 1),
            .init(frequentie: g5, tellen: 2),
            .init(frequentie: d5, tellen: 0.5), .init(frequentie: e5, tellen: 0.5), .init(frequentie: f5, tellen: 2),
            .init(frequentie: d5, tellen: 0.5), .init(frequentie: e5, tellen: 0.5), .init(frequentie: f5, tellen: 2),
            .init(frequentie: d5, tellen: 0.5), .init(frequentie: f5, tellen: 0.5), .init(frequentie: b5, tellen: 0.5),
            .init(frequentie: a5, tellen: 0.5), .init(frequentie: g5, tellen: 1), .init(frequentie: b5, tellen: 1),
            .init(frequentie: c6, tellen: 3),
            .init(frequentie: c5, tellen: 0.5), .init(frequentie: c5, tellen: 0.5), .init(frequentie: c6, tellen: 2),
            .init(frequentie: a5, tellen: 0.5), .init(frequentie: f5, tellen: 0.5), .init(frequentie: g5, tellen: 2),
            .init(frequentie: e5, tellen: 0.5), .init(frequentie: c5, tellen: 0.5), .init(frequentie: f5, tellen: 1),
            .init(frequentie: g5, tellen: 1), .init(frequentie: a5, tellen: 1), .init(frequentie: g5, tellen: 2),
            .init(frequentie: c5, tellen: 0.5), .init(frequentie: c5, tellen: 0.5), .init(frequentie: c6, tellen: 2),
            .init(frequentie: a5, tellen: 0.5), .init(frequentie: f5, tellen: 0.5), .init(frequentie: g5, tellen: 2),
            .init(frequentie: e5, tellen: 0.5), .init(frequentie: c5, tellen: 0.5), .init(frequentie: f5, tellen: 1),
            .init(frequentie: e5, tellen: 1), .init(frequentie: d5, tellen: 1), .init(frequentie: c5, tellen: 3),
            .init(frequentie: rust, tellen: 3),
        ]
        let kortjakje: [MelodieNoot] = [
            .init(frequentie: c5, tellen: 1), .init(frequentie: c5, tellen: 1), .init(frequentie: g5, tellen: 1), .init(frequentie: g5, tellen: 1),
            .init(frequentie: a5, tellen: 1), .init(frequentie: a5, tellen: 1), .init(frequentie: g5, tellen: 2),
            .init(frequentie: f5, tellen: 1), .init(frequentie: f5, tellen: 1), .init(frequentie: e5, tellen: 1), .init(frequentie: e5, tellen: 1),
            .init(frequentie: d5, tellen: 1), .init(frequentie: d5, tellen: 1), .init(frequentie: c5, tellen: 2),
            .init(frequentie: g5, tellen: 1), .init(frequentie: g5, tellen: 1), .init(frequentie: f5, tellen: 1), .init(frequentie: f5, tellen: 1),
            .init(frequentie: e5, tellen: 1), .init(frequentie: e5, tellen: 1), .init(frequentie: d5, tellen: 2),
            .init(frequentie: g5, tellen: 1), .init(frequentie: g5, tellen: 1), .init(frequentie: f5, tellen: 1), .init(frequentie: f5, tellen: 1),
            .init(frequentie: e5, tellen: 1), .init(frequentie: e5, tellen: 1), .init(frequentie: d5, tellen: 2),
            .init(frequentie: c5, tellen: 1), .init(frequentie: c5, tellen: 1), .init(frequentie: g5, tellen: 1), .init(frequentie: g5, tellen: 1),
            .init(frequentie: a5, tellen: 1), .init(frequentie: a5, tellen: 1), .init(frequentie: g5, tellen: 2),
            .init(frequentie: f5, tellen: 1), .init(frequentie: f5, tellen: 1), .init(frequentie: e5, tellen: 1), .init(frequentie: e5, tellen: 1),
            .init(frequentie: d5, tellen: 1), .init(frequentie: d5, tellen: 1), .init(frequentie: c5, tellen: 2),
            .init(frequentie: g4, tellen: 1), .init(frequentie: c4, tellen: 2),
            .init(frequentie: rust, tellen: 3),
        ]
        noten = wiegenlied + kortjakje
        stemmen.reserveCapacity(8)
    }

    func volgendeSample(sampleRate: Double) -> Float {
        let dt = 1.0 / sampleRate

        tijdTotVolgende -= dt
        if tijdTotVolgende <= 0 {
            let noot = noten[notenIndex]
            notenIndex = (notenIndex + 1) % noten.count
            tijdTotVolgende += noot.tellen * secondenPerTel
            if noot.frequentie > 0 {
                stemmen.append(Stem(frequentie: noot.frequentie))
                if stemmen.count > 6 { stemmen.removeFirst() }
            }
        }

        var som = 0.0
        for i in stemmen.indices {
            stemmen[i].leeftijd += dt
            stemmen[i].fase += stemmen[i].frequentie * dt
            if stemmen[i].fase >= 1 { stemmen[i].fase -= 1 }  // fase binnen 0..<1 houden
            let t = stemmen[i].leeftijd
            let p = 2 * .pi * stemmen[i].fase
            let aanslag = min(t / 0.004, 1.0)
            som += aanslag * (sin(p) * exp(-t / 1.1)
                + sin(2 * p) * 0.30 * exp(-t / 0.35)
                + sin(3 * p) * 0.10 * exp(-t / 0.15))
        }
        stemmen.removeAll { $0.leeftijd > 5 }
        return Float(som * 0.16)
    }
}
