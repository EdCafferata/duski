import Foundation

/// Vliegtuigcabine: het diepe, zeer stabiele motorgerommel van een cabine op
/// kruishoogte — extreem laagdoorgelaten ruis met nauwelijks modulatie, bekend
/// als een van de meest gebruikte "in-slaap-sussende" geluiden.
final class VliegtuigcabineGenerator: GeluidGenerator {
    private var laagdoorlaatToestand: Float = 0
    private var faseTrilling: Float = 0

    func volgendeSample(sampleRate: Double) -> Float {
        let wit = Float.random(in: -1...1)
        laagdoorlaatToestand += 0.015 * (wit - laagdoorlaatToestand)

        faseTrilling += Float(1.0 / sampleRate) * 0.03
        let trilling = 0.95 + 0.05 * sin(faseTrilling * 2 * .pi)

        return laagdoorlaatToestand * 2.2 * trilling
    }
}
