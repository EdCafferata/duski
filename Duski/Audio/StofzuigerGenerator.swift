import Foundation

/// Stofzuiger: hoger en "voller" dan de föhn — een motortoon met boventonen, een
/// licht fluitende luchtstroom in het midden en een brede ruisdeken eronder. Een
/// van de bekendste geluiden om baby's te sussen.
final class StofzuigerGenerator: GeluidGenerator {
    private var faseMotor: Float = 0
    private var faseZweef: Float = 0
    private var laag: Float = 0
    private var band1: Float = 0
    private var band2: Float = 0

    func volgendeSample(sampleRate: Double) -> Float {
        let dt = Float(1.0 / sampleRate)

        // Heel trage toonhoogtezweving, zoals een echte motor.
        faseZweef += dt * 0.05
        if faseZweef >= 1 { faseZweef -= 1 }  // fase binnen 0..<1 houden
        let toon: Float = 165 * (1 + 0.01 * sin(faseZweef * 2 * .pi))

        faseMotor += dt * toon
        if faseMotor >= 1 { faseMotor -= 1 }  // fase binnen 0..<1 houden
        let p = faseMotor * 2 * .pi
        let motor = sin(p) * 0.10 + sin(2 * p) * 0.06 + sin(3 * p) * 0.03

        let wit = Float.random(in: -1...1)
        // Brede ruisdeken (laagdoorlaat).
        laag += 0.35 * (wit - laag)
        // Smalle middenband voor het "fluiten" van de luchtstroom.
        band1 += 0.5 * (wit - band1)
        let hoog = wit - band1
        band2 += 0.45 * (hoog - band2)

        return motor + laag * 0.45 + band2 * 0.35
    }
}
