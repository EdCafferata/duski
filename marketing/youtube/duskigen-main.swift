import Foundation
// Rendert Duski's eigen generatoren naar raw float32 mono op stdout.
// gebruik: duskigen <geluid> <seconden> [sampleRate]
protocol GeluidGenerator: AnyObject { func volgendeSample(sampleRate: Double) -> Float }
let a = CommandLine.arguments
let sr = a.count > 3 ? Double(a[3])! : 48000
let n = Int(Double(a[2])! * sr)
let g: GeluidGenerator
switch a[1] {
case "wit": g = RuisGenerator(kleur: .wit)
case "roze": g = RuisGenerator(kleur: .roze)
case "bruin": g = RuisGenerator(kleur: .bruin)
case "hartslag": g = HartslagGenerator()
case "baarmoeder": g = BaarmoederGenerator()
case "fohn": g = FohnGenerator()
case "sussen": g = SussenGenerator()
case "regen": g = RegenGenerator()
default: fatalError("onbekend geluid")
}
var buf = [Float](repeating: 0, count: 48000)
var done = 0
let out = FileHandle.standardOutput
while done < n {
    let k = min(buf.count, n - done)
    for i in 0..<k { buf[i] = g.volgendeSample(sampleRate: sr) }
    buf.withUnsafeBufferPointer { out.write(Data(buffer: UnsafeBufferPointer(rebasing: $0[0..<k]))) }
    done += k
}
