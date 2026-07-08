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
    @State private var geselecteerdeCategorie = GeluidCategorie.allCases[0]

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if leeftijdsGroep == .baby {
                    VeiligheidsBanner()
                        .padding(.horizontal)
                        .padding(.top, 12)
                }

                TabView(selection: $geselecteerdeCategorie) {
                    ForEach(GeluidCategorie.allCases) { categorie in
                        CategoriePagina(categorie: categorie, mixer: mixer)
                            .tag(categorie)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(height: 380)

                SlaapTimerKaart(timer: slaapTimer, mixer: mixer)
                    .padding(.horizontal)
                    .padding(.bottom, 12)

                Spacer(minLength: 0)
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

/// Eén swipebare pagina per categorie: titel altijd op één regel, en een vaste
/// 2-koloms grid zodat alle geluidstegels van die categorie op één scherm
/// passen — geen scrollen nodig.
private struct CategoriePagina: View {
    let categorie: GeluidCategorie
    @ObservedObject var mixer: GeluidsMixer

    private let kolommen = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Spacer(minLength: 0)

            Text(categorie.titel)
                .font(.title3.weight(.semibold))
                .lineLimit(1)
                .minimumScaleFactor(0.7)

            LazyVGrid(columns: kolommen, spacing: 12) {
                ForEach(categorie.opties) { optie in
                    GeluidTegel(optie: optie, mixer: mixer)
                }
            }

            Spacer(minLength: 0)
        }
        .padding(.horizontal)
        .padding(.bottom, 32)
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
                    Text(optie.titel).font(.caption.weight(.medium))
                }
                .frame(maxWidth: .infinity)
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
