import SwiftUI
import StoreKit

/// Eén abonnementskaart op de paywall: naam, looptijd, prijs, koopknop en de
/// verlengingsvoorwaarden. De gratis proefperiode wordt alleen genoemd als de
/// gebruiker er nog recht op heeft.
struct PremiumProductKaart: View {
    let product: Product
    let onKoop: () -> Void

    @State private var komtInAanmerkingVoorProef = false

    private var toontProef: Bool { product.heeftGratisProef && komtInAanmerkingVoorProef }

    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                Text(product.displayName).font(.headline)
                if product.isJaarabonnement {
                    Text("Voordeligst")
                        .font(.caption2.weight(.semibold))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(.tint.opacity(0.2), in: .capsule)
                }
            }

            Text(product.looptijdEnPrijs)
                .font(.subheadline)
                .multilineTextAlignment(.center)

            Button(action: onKoop) {
                Text(toontProef ? "Start gratis proefmaand" : "Abonneren")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)

            VStack(spacing: 2) {
                if toontProef {
                    Text("De eerste maand is gratis.")
                }
                Text(product.verlengingsTekst)
            }
            .font(.caption2)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 18))
        .task {
            komtInAanmerkingVoorProef = await product.subscription?.isEligibleForIntroOffer ?? false
        }
    }
}
