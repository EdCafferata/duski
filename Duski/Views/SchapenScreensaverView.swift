import SwiftUI

/// Speelse screensaver: schaapjes die van rechts naar links lopen en over een
/// los hekje springen — het klassieke "schaapjes tellen"-beeld, als leuk
/// extraatje zodra er een geluid speelt. Tik ergens om terug te gaan.
///
/// Richting: het 🐑-emoji kijkt van nature naar links, dus de schapen lopen
/// naar links zodat het lopen niet "achteruit" oogt.
struct SchapenScreensaverView: View {
    let onSluiten: () -> Void

    /// Elk schaap heeft een eigen snelheid/fase zodat ze niet synchroon lopen.
    private let schapen: [(snelheid: Double, faseVerschuiving: Double)] = [
        (snelheid: 70, faseVerschuiving: 0.0),
        (snelheid: 95, faseVerschuiving: 1.4),
        (snelheid: 55, faseVerschuiving: 2.8),
    ]

    var body: some View {
        TimelineView(.animation) { context in
            let tijd = context.date.timeIntervalSinceReferenceDate

            GeometryReader { geo in
                let grondLijnY = geo.size.height - 160
                let hekX = geo.size.width * 0.68

                ZStack {
                    LinearGradient(
                        colors: [Color(red: 0.10, green: 0.12, blue: 0.24), Color(red: 0.04, green: 0.05, blue: 0.10)],
                        startPoint: .top, endPoint: .bottom
                    )
                    .ignoresSafeArea()

                    Text("🌙")
                        .font(.system(size: 54))
                        .position(x: geo.size.width * 0.82, y: geo.size.height * 0.16)

                    Hekje()
                        .fill(Color.white.opacity(0.4))
                        .frame(width: 100, height: 64)
                        .position(x: hekX, y: grondLijnY - 20)

                    ForEach(Array(schapen.enumerated()), id: \.offset) { _, schaap in
                        let breedteMetSchaap = geo.size.width + 80
                        let voortgang = (tijd * schaap.snelheid + schaap.faseVerschuiving * 220)
                            .truncatingRemainder(dividingBy: breedteMetSchaap)
                        let x = breedteMetSchaap - voortgang - 40

                        // Kleine wandel-bob de hele tijd, plus een duidelijke sprong
                        // precies wanneer het schaap het hekje passeert.
                        let wandelBob = abs(sin(tijd * schaap.snelheid / 30 + schaap.faseVerschuiving)) * 6
                        let afstandTotHek = abs(x - hekX)
                        let hekSpringBreedte: CGFloat = 90
                        let sprong: CGFloat = afstandTotHek < hekSpringBreedte
                            ? sin(.pi * (1 - afstandTotHek / hekSpringBreedte)) * 50
                            : 0

                        Text("🐑")
                            .font(.system(size: 44))
                            .position(x: x, y: grondLijnY - wandelBob - sprong)
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
}

/// Los hekje: twee ronde paaltjes met twee dwarsbalken ertussen — een klein,
/// op zichzelf staand hek in plaats van een lijn over het hele scherm.
private struct Hekje: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let paalBreedte: CGFloat = 8
        let paalX: [CGFloat] = [rect.width * 0.12, rect.width * 0.5, rect.width * 0.88]

        for x in paalX {
            let paal = CGRect(x: x - paalBreedte / 2, y: 0, width: paalBreedte, height: rect.height)
            path.addRoundedRect(in: paal, cornerSize: CGSize(width: paalBreedte / 2, height: paalBreedte / 2))
        }

        let balkHoogte: CGFloat = 9
        for balkY in [rect.height * 0.22, rect.height * 0.62] {
            let balk = CGRect(x: 0, y: balkY - balkHoogte / 2, width: rect.width, height: balkHoogte)
            path.addRoundedRect(in: balk, cornerSize: CGSize(width: balkHoogte / 2, height: balkHoogte / 2))
        }

        return path
    }
}

#Preview {
    SchapenScreensaverView(onSluiten: {})
}
