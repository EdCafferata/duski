import SwiftUI

/// Kaart onderaan het mixer-scherm waarmee je een sleeptimer instelt.
struct SlaapTimerKaart: View {
    @ObservedObject var timer: SlaapTimer
    @ObservedObject var mixer: GeluidsMixer
    var toontScreensaverKnop: Bool = false
    var onScreensaver: () -> Void = {}

    private let opties = [15, 30, 45, 60, 90]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Sleeptimer")
                .font(.title3.weight(.semibold))

            if timer.resterendeSeconden != nil || timer.isAltijdAan {
                HStack(spacing: 10) {
                    if toontScreensaverKnop {
                        Button(action: onScreensaver) {
                            Image(systemName: "moon.stars.fill")
                                .font(.system(size: 20))
                                .foregroundStyle(.indigo)
                                .frame(width: 60, height: 60)
                                .background(Color.indigo.opacity(0.18), in: .circle)
                        }
                        .buttonStyle(.plain)
                    }

                    HStack {
                        if let resterend = timer.resterendeSeconden {
                            Text(tijdText(resterend))
                                .font(.system(.title2, design: .rounded, weight: .bold))
                                .monospacedDigit()
                        } else {
                            Label("Altijd aan", systemImage: "infinity")
                                .font(.system(.title3, design: .rounded, weight: .bold))
                        }
                        Spacer()
                        Button("Stop", role: .destructive) { timer.stop() }
                    }
                    .padding()
                    .background(.thinMaterial, in: .rect(cornerRadius: 18))
                }
            } else {
                HStack(spacing: 10) {
                    if toontScreensaverKnop {
                        Button(action: onScreensaver) {
                            Image(systemName: "moon.stars.fill")
                                .font(.system(size: 20))
                                .foregroundStyle(.indigo)
                                .frame(width: 60, height: 60)
                                .background(Color.indigo.opacity(0.18), in: .circle)
                        }
                        .buttonStyle(.plain)
                    }

                    ForEach(opties, id: \.self) { minuten in
                        Button {
                            timer.start(minuten: minuten, mixer: mixer)
                        } label: {
                            VStack(spacing: 0) {
                                Text("\(minuten)")
                                    .font(.system(.body, design: .rounded, weight: .bold))
                                Text("min")
                                    .font(.caption2)
                            }
                            .frame(width: 60, height: 60)
                            .background(Color(.systemGray5), in: .circle)
                        }
                        .buttonStyle(.plain)
                    }
                }

                // Eigen rij: op kleine schermen passen er naast de 5 tijdknoppen
                // en de screensaver-knop geen extra ronde knoppen meer.
                Button {
                    timer.startAltijdAan()
                } label: {
                    Label("Altijd aan", systemImage: "infinity")
                        .font(.system(.body, design: .rounded, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color(.systemGray5), in: .capsule)
                }
                .buttonStyle(.plain)
                .accessibilityHint(Text("Speelt de hele nacht door, zonder uitfaden of automatische stop"))
            }
        }
    }

    private func tijdText(_ seconden: Int) -> String {
        String(format: "%02d:%02d", seconden / 60, seconden % 60)
    }
}
