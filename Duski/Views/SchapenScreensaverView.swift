import SwiftUI

/// Speelse screensaver: schaapjes die over een hek springen, doorlopend van
/// links naar rechts — het klassieke "schaapjes tellen"-beeld, als leuk
/// extraatje zodra er een geluid speelt. Tik ergens om terug te gaan.
struct SchapenScreensaverView: View {
    let onSluiten: () -> Void

    /// Elk schaap heeft een eigen snelheid/fase zodat ze niet synchroon lopen.
    private let schapen: [(snelheid: Double, faseVerschuiving: Double, hoogte: Double)] = [
        (snelheid: 70, faseVerschuiving: 0.0, hoogte: 0.62),
        (snelheid: 95, faseVerschuiving: 1.4, hoogte: 0.62),
        (snelheid: 55, faseVerschuiving: 2.8, hoogte: 0.62),
    ]

    var body: some View {
        TimelineView(.animation) { context in
            let tijd = context.date.timeIntervalSinceReferenceDate

            GeometryReader { geo in
                ZStack {
                    LinearGradient(
                        colors: [Color(red: 0.10, green: 0.12, blue: 0.24), Color(red: 0.04, green: 0.05, blue: 0.10)],
                        startPoint: .top, endPoint: .bottom
                    )
                    .ignoresSafeArea()

                    Text("🌙")
                        .font(.system(size: 54))
                        .position(x: geo.size.width * 0.82, y: geo.size.height * 0.16)

                    Hek(breedte: geo.size.width)
                        .stroke(Color.white.opacity(0.35), lineWidth: 3)
                        .frame(height: 60)
                        .position(x: geo.size.width / 2, y: geo.size.height * 0.66)

                    ForEach(Array(schapen.enumerated()), id: \.offset) { _, schaap in
                        let breedteMetSchaap = geo.size.width + 80
                        let x = (tijd * schaap.snelheid + schaap.faseVerschuiving * 200)
                            .truncatingRemainder(dividingBy: breedteMetSchaap) - 40
                        let hop = abs(sin((tijd * schaap.snelheid / 40) + schaap.faseVerschuiving)) * 26

                        Text("🐑")
                            .font(.system(size: 44))
                            .position(x: x, y: geo.size.height * schaap.hoogte - hop)
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

/// Simpele hekvorm: twee palen per sectie met een dwarslat, herhaald over de breedte.
private struct Hek: Shape {
    let breedte: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let sectieBreedte: CGFloat = 70
        var x: CGFloat = 0
        while x < breedte {
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: rect.height))
            x += sectieBreedte
        }
        path.move(to: CGPoint(x: 0, y: rect.height * 0.35))
        path.addLine(to: CGPoint(x: breedte, y: rect.height * 0.35))
        return path
    }
}

#Preview {
    SchapenScreensaverView(onSluiten: {})
}
