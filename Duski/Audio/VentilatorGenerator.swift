import Foundation

/// Ventilator: motorzoem plus het ritmische "wiek-effect" van ronddraaiende
/// ventilatorbladen — net als Föhn een klassiek witte-ruis-apparaat-geluid, maar
/// dieper en met een tragere, mechanische puls.
final class VentilatorGenerator: GeluidGenerator {
    private var faseMotor: Float = 0
    private var faseWiek: Float = 0
    private var laagdoorlaatToestand: Float = 0

    func volgendeSample(sampleRate: Double) -> Float {
        faseMotor += Float(1.0 / sampleRate) * 60
        if faseMotor >= 1 { faseMotor -= 1 }  // fase binnen 0..<1 houden: een eindeloos oplopende Float verliest na enkele minuten precisie
        let motor = sin(faseMotor * 2 * .pi) * 0.15

        faseWiek += Float(1.0 / sampleRate) * 7
        if faseWiek >= 1 { faseWiek -= 1 }  // fase binnen 0..<1 houden: een eindeloos oplopende Float verliest na enkele minuten precisie
        let wiek = 0.7 + 0.3 * sin(faseWiek * 2 * .pi)

        let wit = Float.random(in: -1...1)
        laagdoorlaatToestand += 0.2 * (wit - laagdoorlaatToestand)

        return (motor + laagdoorlaatToestand * 0.5) * wiek
    }
}
