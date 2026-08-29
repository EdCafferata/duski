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
    @State private var toontScreensaver = false
    @State private var toontVeiligheidsBanner = true

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    if leeftijdsGroep == .baby && toontVeiligheidsBanner {
                        VeiligheidsBanner(onVerlopen: {
                            withAnimation { toontVeiligheidsBanner = false }
                        })
                        .transition(.opacity.combined(with: .move(edge: .top)))
                    }

                    ForEach(GeluidCategorie.allCases) { categorie in
                        VStack(alignment: .leading, spacing: 12) {
                            Text(categorie.titel)
                                .font(.title3.weight(.semibold))

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(categorie.opties) { optie in
                                        GeluidTegel(
                                            optie: optie,
                                            mixer: mixer,
                                            vergrendeld: optie.isPremium && !abonnement.heeftPremium,
                                            onVergrendeldTikken: { toontPremium = true }
                                        )
                                    }
                                }
                                .padding(.horizontal, 2)
                            }
                        }
                    }

                    SlaapTimerKaart(
                        timer: slaapTimer,
                        mixer: mixer,
                        toontScreensaverKnop: !mixer.actieveOpties.isEmpty,
                        onScreensaver: { toontScreensaver = true }
                    )
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
        .onChange(of: abonnement.heeftPremium) { _, heeftPremium in
            // Stopt een lopend premium-geluid zodra het abonnement verloopt
            // (bv. opgezegd terwijl de app op de achtergrond draaide).
            guard !heeftPremium else { return }
            let alleOpties = GeluidCategorie.allCases.flatMap(\.opties)
            for id in mixer.actieveOpties {
                if alleOpties.first(where: { $0.id == id })?.isPremium == true {
                    mixer.stopAlles()
                    break
                }
            }
        }
        .sheet(isPresented: $toontPremium) {
            PremiumView(abonnement: abonnement)
        }
        .fullScreenCover(isPresented: $toontScreensaver) {
            ScreensaverKiezerView(onSluiten: { toontScreensaver = false })
        }
    }
}

/// Eén tegel voor een geluidslaag: aan/uit + volumeslider zodra actief.
/// Premium-geluiden tonen een slotje en openen de paywall in plaats van te spelen.
private struct GeluidTegel: View {
    let optie: GeluidOptie
    @ObservedObject var mixer: GeluidsMixer
    let vergrendeld: Bool
    let onVergrendeldTikken: () -> Void

    private let breedte: CGFloat = 104

    var body: some View {
        let actief = !vergrendeld && mixer.isActief(optie)

        VStack(spacing: 7) {
            Button {
                if vergrendeld {
                    onVergrendeldTikken()
                } else {
                    mixer.schakel(optie)
                }
            } label: {
                VStack(spacing: 4) {
                    ZStack(alignment: .topTrailing) {
                        Text(optie.emoji).font(.system(size: 24))
                        if vergrendeld {
                            Image(systemName: "lock.fill")
                                .font(.system(size: 10))
                                .foregroundStyle(.secondary)
                                .offset(x: 8, y: -4)
                        }
                    }
                    Text(optie.titel)
                        .font(.caption2.weight(.medium))
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                }
                .frame(width: breedte)
                .padding(.horizontal, 4)
                .padding(.vertical, 10)
                .opacity(vergrendeld ? 0.6 : 1)
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
                .frame(width: breedte - 14)
                .padding(.bottom, 6)
            }
        }
        .frame(width: breedte)
        .background(actief ? AnyShapeStyle(.tint.opacity(0.25)) : AnyShapeStyle(.thinMaterial), in: .rect(cornerRadius: 14))
    }
}

#Preview {
    MixerView(leeftijdsGroep: .volwassene, onWijzigGroep: {})
}
