import Foundation

/// Klankschaal: additieve synthese van een grondtoon + boventonen (licht verstemd
/// voor het karakteristieke "zwevende" klankschaal-timbre), die na een zachte
/// aanslag langzaam wegsterft en zichzelf daarna opnieuw aanslaat.
final class KlankschaalGenerator: GeluidGenerator {
    private let grondtoon: Double = 136.1 // traditionele "Om"-frequentie
    private let boventoonVerhoudingen: [Double] = [1.0, 2.005, 2.995, 4.02]
    private let boventoonSterktes: [Double] = [1.0, 0.5, 0.3, 0.15]

    private var faseSindsAanslag: Double = 0
    private var volgendeAanslagOver: Double = 0
    private var oscillatorFases: [Double]

    init() {
        oscillatorFases = Array(repeating: 0, count: boventoonVerhoudingen.count)
    }

    func volgendeSample(sampleRate: Double) -> Float {
        let dt = 1.0 / sampleRate
        faseSindsAanslag += dt
        volgendeAanslagOver -= dt

        if volgendeAanslagOver <= 0 {
            faseSindsAanslag = 0
            volgendeAanslagOver = Double.random(in: 9...14)
        }

        let envelope = exp(-faseSindsAanslag * 0.35)

        var signaal: Double = 0
        for (index, verhouding) in boventoonVerhoudingen.enumerated() {
            oscillatorFases[index] += grondtoon * verhouding * dt
            if oscillatorFases[index] > 1 { oscillatorFases[index] -= 1 }
            signaal += sin(2 * .pi * oscillatorFases[index]) * boventoonSterktes[index]
        }

        return Float(signaal * envelope * 0.15)
    }
}
