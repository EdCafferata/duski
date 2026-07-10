import SwiftUI

/// Screensaver-kiezer: zelfde schermopbouw als het geluidsmixer-scherm
/// (categorieën met horizontaal scrollende tegels), maar dan gevuld met
/// screensaver-animaties in plaats van geluiden.
struct ScreensaverKiezerView: View {
    let onSluiten: () -> Void

    @State private var gekozenOptie: ScreensaverOptie?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    ForEach(GeluidCategorie.allCases) { categorie in
                        VStack(alignment: .leading, spacing: 12) {
                            Text(categorie.titel)
                                .font(.title3.weight(.semibold))

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(categorie.screensaverOpties) { optie in
                                        ScreensaverTegel(optie: optie) {
                                            gekozenOptie = optie
                                        }
                                    }
                                }
                                .padding(.horizontal, 2)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Screensaver")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Terug", action: onSluiten)
                }
            }
        }
        .fullScreenCover(item: $gekozenOptie) { optie in
            switch optie.type {
            case .schaapjesTellen:
                SchapenScreensaverView(onSluiten: { gekozenOptie = nil })
            case .animatie(let config):
                AnimatedScreensaverView(config: config, onSluiten: { gekozenOptie = nil })
            }
        }
    }
}

/// Eén tegel voor een screensaver-optie — zelfde vormgeving als de
/// geluidstegels in MixerView, zonder aan/uit-toestand.
private struct ScreensaverTegel: View {
    let optie: ScreensaverOptie
    let onKies: () -> Void

    private let breedte: CGFloat = 104

    var body: some View {
        Button(action: onKies) {
            VStack(spacing: 4) {
                Text(optie.emoji).font(.system(size: 24))
                Text(optie.titel)
                    .font(.caption2.weight(.medium))
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)
            }
            .frame(width: breedte)
            .padding(.horizontal, 4)
            .padding(.vertical, 10)
        }
        .buttonStyle(.plain)
        .frame(width: breedte)
        .background(.thinMaterial, in: .rect(cornerRadius: 14))
    }
}

#Preview {
    ScreensaverKiezerView(onSluiten: {})
}
