import SwiftUI
import StoreKit

/// Eenvoudig paywall-scherm: 30 dagen gratis, daarna het abonnement. Toont de
/// prijs die StoreKit voor het huidige land teruggeeft (automatisch de juiste
/// lokale prijstier zodra dit in App Store Connect staat).
struct PremiumView: View {
    @ObservedObject var abonnement: AbonnementManager
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("🌙").font(.system(size: 64))

                Text("Ontgrendel alle geluiden")
                    .font(.system(.title, design: .rounded, weight: .bold))

                Text("22 extra geluiden en arrangementen, in elke categorie — 30 dagen gratis, daarna het laagste tarief voor jouw land. Elk moment op te zeggen.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

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
                    VStack(spacing: 8) {
                        // Guideline 3.1.2(c): naam, looptijd en prijs van het abonnement
                        // moeten in de koopflow zichtbaar zijn.
                        Text("\(product.displayName) — 1 maand, \(product.displayPrice) per maand")
                            .font(.headline)
                            .multilineTextAlignment(.center)

                        Button {
                            Task { await abonnement.koop(product) }
                        } label: {
                            Text("Start gratis proefperiode — daarna \(product.displayPrice)/maand")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)

                        Text("De eerste 30 dagen zijn gratis. Daarna wordt het abonnement automatisch elke maand verlengd tegen \(product.displayPrice), tenzij je het minstens 24 uur vóór het einde van de lopende periode opzegt via de abonnementsinstellingen van je Apple-account.")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
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

                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Sluiten") { dismiss() }
                }
            }
        }
        .task { await abonnement.laadProducten() }
    }
}

#Preview {
    PremiumView(abonnement: AbonnementManager())
}
