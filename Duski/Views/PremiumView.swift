import SwiftUI
import StoreKit

/// Paywall-scherm: jaar- en maandabonnement uit dezelfde subscription group,
/// met de prijs die StoreKit voor het huidige land teruggeeft.
struct PremiumView: View {
    @ObservedObject var abonnement: AbonnementManager
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("🌙").font(.system(size: 56))

                    Text("Ontgrendel alle geluiden")
                        .font(.system(.title, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.center)

                    Text("Bruine ruis, golven, kampvuur, baarmoedergeluiden, sussen en 5 klassieke stukken — zo vaak en zo lang je wilt.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    PremiumVoordelen()

                    if let fout = abonnement.laadFout {
                        VStack(spacing: 12) {
                            Text(fout).font(.caption).foregroundStyle(.red)
                            Button("Opnieuw proberen") {
                                Task { await abonnement.laadProducten() }
                            }
                            .buttonStyle(.bordered)
                        }
                    }

                    ForEach(abonnement.producten) { product in
                        PremiumProductKaart(product: product) {
                            Task { await abonnement.koop(product) }
                        }
                    }

                    if abonnement.producten.isEmpty && abonnement.laadFout == nil {
                        ProgressView()
                    }

                    Button("Aankopen herstellen") {
                        Task { await abonnement.herstelAankopen() }
                    }
                    .font(.footnote)

                    // Guideline 3.1.2(c): werkende links naar de gebruiksvoorwaarden (EULA)
                    // en het privacybeleid in de app zelf.
                    HStack(spacing: 16) {
                        Link("Gebruiksvoorwaarden (EULA)", destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/")!)
                        Link("Privacybeleid", destination: URL(string: "https://cafferata.info/duski/privacy.html")!)
                    }
                    .font(.footnote)
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Sluiten") { dismiss() }
                }
            }
        }
        .task { await abonnement.laadProducten() }
        .onChange(of: abonnement.heeftPremium) { _, heeftPremium in
            if heeftPremium { dismiss() }
        }
    }
}

#Preview {
    PremiumView(abonnement: AbonnementManager())
}
