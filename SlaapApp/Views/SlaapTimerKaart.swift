import SwiftUI

/// Kaart onderaan het mixer-scherm waarmee je een sleeptimer instelt.
struct SlaapTimerKaart: View {
    @ObservedObject var timer: SlaapTimer
    @ObservedObject var mixer: GeluidsMixer

    private let opties = [15, 30, 45, 60, 90]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Sleeptimer")
                .font(.title3.weight(.semibold))

            if let resterend = timer.resterendeSeconden {
                HStack {
                    Text(tijdText(resterend))
                        .font(.system(.title2, design: .rounded, weight: .bold))
                        .monospacedDigit()
                    Spacer()
                    Button("Stop", role: .destructive) { timer.stop() }
                }
                .padding()
                .background(.thinMaterial, in: .rect(cornerRadius: 18))
            } else {
                HStack(spacing: 10) {
                    ForEach(opties, id: \.self) { minuten in
                        Button("\(minuten) min") {
                            timer.start(minuten: minuten, mixer: mixer)
                        }
                        .buttonStyle(.bordered)
                    }
                }
            }
        }
    }

    private func tijdText(_ seconden: Int) -> String {
        String(format: "%02d:%02d", seconden / 60, seconden % 60)
    }
}
