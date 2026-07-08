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

                Text("30 dagen gratis")
                    .font(.system(.title, design: .rounded, weight: .bold))

                Text("Daarna het laagste tarief voor jouw land. Elk moment op te zeggen.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                if let fout = abonnement.laadFout {
                    Text(fout).font(.caption).foregroundStyle(.red)
                }

                ForEach(abonnement.producten) { product in
                    Button {
                        Task { await abonnement.koop(product) }
                    } label: {
                        Text("Start gratis proefperiode — daarna \(product.displayPrice)/maand")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }

                if abonnement.producten.isEmpty && abonnement.laadFout == nil {
                    ProgressView()
                }

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
