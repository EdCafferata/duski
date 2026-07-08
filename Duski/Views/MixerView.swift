import SwiftUI

/// Hoofdscherm: kies losse geluidslagen en mix ze, elk met een eigen volume —
/// zelfde interactiepatroon als de meeste succesvolle slaap-apps (Noisli,
/// BetterSleep; zie onderzoek/02_muziek_en_geluidscategorieen.md).
struct MixerView: View {
    let leeftijdsGroep: LeeftijdsGroep
    let onWijzigGroep: () -> Void

    @StateObject private var mixer = GeluidsMixer()
    @StateObject private var slaapTimer = SlaapTimer()
    @StateObject private var abonnement = AbonnementManager()
    @State private var toontPremium = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    if leeftijdsGroep == .baby {
                        VeiligheidsBanner()
                    }

                    ForEach(GeluidCategorie.allCases) { categorie in
                        VStack(alignment: .leading, spacing: 12) {
                            Text(categorie.titel)
                                .font(.title3.weight(.semibold))

                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 12)], spacing: 12) {
                                ForEach(categorie.opties) { optie in
                                    GeluidTegel(optie: optie, mixer: mixer)
                                }
                            }
                        }
                    }

                    SlaapTimerKaart(timer: slaapTimer, mixer: mixer)
                }
                .padding()
            }
            .navigationTitle("\(leeftijdsGroep.emoji) \(leeftijdsGroep.titel)")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    if !abonnement.heeftPremium {
                        Button("Premium") { toontPremium = true }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Wijzig", action: {
                        mixer.stopAlles()
                        onWijzigGroep()
                    })
                }
            }
        }
        .onAppear {
            mixer.stelMaximaalVolumeIn(leeftijdsGroep.maximaalVolume)
        }
        .sheet(isPresented: $toontPremium) {
            PremiumView(abonnement: abonnement)
        }
    }
}

/// Eén tegel voor een geluidslaag: aan/uit + volumeslider zodra actief.
private struct GeluidTegel: View {
    let optie: GeluidOptie
    @ObservedObject var mixer: GeluidsMixer

    var body: some View {
        let actief = mixer.isActief(optie)

        VStack(spacing: 10) {
            Button {
                mixer.schakel(optie)
            } label: {
                VStack(spacing: 6) {
                    Text(optie.emoji).font(.system(size: 32))
                    Text(optie.titel)
                        .font(.caption.weight(.medium))
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 6)
                .padding(.vertical, 14)
            }
            .buttonStyle(.plain)

            if actief {
                Slider(
                    value: Binding(
                        get: { mixer.volumes[optie.id] ?? 0.7 },
                        set: { mixer.zetVolume(voor: optie, naar: $0) }
                    ),
                    in: 0...1
                )
                .padding(.horizontal, 10)
                .padding(.bottom, 8)
            }
        }
        .background(actief ? AnyShapeStyle(.tint.opacity(0.25)) : AnyShapeStyle(.thinMaterial), in: .rect(cornerRadius: 18))
    }
}

#Preview {
    MixerView(leeftijdsGroep: .tienerVolwassene, onWijzigGroep: {})
}
