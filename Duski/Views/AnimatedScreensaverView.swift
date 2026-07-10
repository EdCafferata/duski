import SwiftUI

/// Herbruikbare screensaver-animatie: plaatst een aantal drijvende, vallende,
/// glijdende, twinkelende of deinende emoji-elementen over een verticaal
/// kleurverloop — puur SwiftUI/TimelineView-animatie, geen video- of
/// mediabestanden van derden nodig (zelfde rechtenvrije aanpak als de
/// audio-generators). Tik ergens om terug te gaan.
struct AnimatedScreensaverView: View {
    let config: ScreensaverConfig
    let onSluiten: () -> Void

    var body: some View {
        TimelineView(.animation) { context in
            let tijd = context.date.timeIntervalSinceReferenceDate

            GeometryReader { geo in
                ZStack {
                    LinearGradient(
                        colors: [config.achtergrondBoven, config.achtergrondOnder],
                        startPoint: .top, endPoint: .bottom
                    )
                    .ignoresSafeArea()

                    ForEach(0..<config.aantalElementen, id: \.self) { index in
                        elementView(index: index, tijd: tijd, geo: geo)
                    }

                    VStack {
                        Spacer()
                        Text("Tik om terug te gaan")
                            .font(.footnote)
                            .foregroundStyle(.white.opacity(0.4))
                            .padding(.bottom, 40)
                    }
                }
            }
        }
        .contentShape(.rect)
        .onTapGesture { onSluiten() }
        .statusBarHidden()
    }

    @ViewBuilder
    private func elementView(index: Int, tijd: Double, geo: GeometryProxy) -> some View {
        let seed = Double(index)
        let breedte = geo.size.width
        let hoogte = geo.size.height
        let faseVerschuiving = fractie(seed * 78.233)
        let snelheid = config.snelheid * (0.7 + 0.6 * fractie(seed * 37.719))

        switch config.beweging {
        case .glijdenZijwaarts:
            let baanY = hoogte * (0.15 + 0.7 * fractie(seed * 12.9898))
            let breedteMetElement = breedte + 80
            let voortgang = (tijd * snelheid + faseVerschuiving * breedteMetElement)
                .truncatingRemainder(dividingBy: breedteMetElement)
            let x = breedteMetElement - voortgang - 40
            Text(config.elementEmoji)
                .font(.system(size: 34))
                .position(x: x, y: baanY)

        case .vallenOmlaag:
            let hoogteMetElement = hoogte + 80
            let voortgang = (tijd * snelheid * 20 + faseVerschuiving * hoogteMetElement)
                .truncatingRemainder(dividingBy: hoogteMetElement)
            let x = breedte * fractie(seed * 12.9898)
            Text(config.elementEmoji)
                .font(.system(size: 20))
                .position(x: x, y: voortgang - 40)

        case .drijvenOmhoog:
            let hoogteMetElement = hoogte + 80
            let voortgang = (tijd * snelheid * 14 + faseVerschuiving * hoogteMetElement)
                .truncatingRemainder(dividingBy: hoogteMetElement)
            let x = breedte * fractie(seed * 12.9898)
            let deining = sin(tijd * 0.6 + seed * 6) * 14
            Text(config.elementEmoji)
                .font(.system(size: 22))
                .position(x: x + deining, y: hoogteMetElement - voortgang - 40)

        case .twinkelen:
            let x = breedte * (index == 0 ? 0.5 : fractie(seed * 12.9898))
            let y = hoogte * (index == 0 ? 0.42 : (0.1 + 0.5 * fractie(seed * 45.164)))
            let puls = 0.6 + 0.4 * sin(tijd * (1.2 + fractie(seed * 91.7)) + seed * 6)
            Text(config.elementEmoji)
                .font(.system(size: index == 0 ? 64 : 26))
                .scaleEffect(0.8 + 0.3 * puls)
                .opacity(0.4 + 0.6 * puls)
                .position(x: x, y: y)

        case .deinen:
            let x = breedte * (index == 0 ? 0.5 : (0.1 + 0.8 * fractie(seed * 12.9898)))
            let baseY = hoogte * (index == 0 ? 0.42 : (0.3 + 0.5 * fractie(seed * 45.164)))
            let deining = sin(tijd * 0.8 + seed * 5) * 18
            Text(config.elementEmoji)
                .font(.system(size: index == 0 ? 64 : 30))
                .position(x: x, y: baseY + deining)
        }
    }

    /// Deterministische pseudo-willekeurige fractie tussen 0 en 1, puur op
    /// basis van een seed-waarde (geen echte randomness nodig voor een
    /// stabiele lay-out per element).
    private func fractie(_ waarde: Double) -> Double {
        let x = sin(waarde) * 43758.5453
        return x - floor(x)
    }
}

#Preview {
    AnimatedScreensaverView(
        config: ScreensaverConfig(
            elementEmoji: "✨",
            achtergrondBoven: Color(red: 0.04, green: 0.04, blue: 0.14),
            achtergrondOnder: Color(red: 0.01, green: 0.01, blue: 0.04),
            beweging: .twinkelen,
            aantalElementen: 24,
            snelheid: 20
        ),
        onSluiten: {}
    )
}
