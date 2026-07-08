import StoreKit
import Combine

/// StoreKit 2-wrapper: laadt het abonnement, koopt het, en houdt bij of Premium
/// actief is. 30 dagen gratis via de introductoryOffer op het product zelf
/// (geconfigureerd in Configuration.storekit / straks App Store Connect),
/// daarna de laagste door Apple toegestane prijs per land.
@MainActor
final class AbonnementManager: ObservableObject {
    @Published private(set) var producten: [Product] = []
    @Published private(set) var heeftPremium = false
    @Published private(set) var laadFout: String?

    private var updatesTaak: Task<Void, Never>?

    init() {
        updatesTaak = luisterNaarTransacties()
        Task {
            await laadProducten()
            await werkAbonnementStatusBij()
        }
    }

    deinit {
        updatesTaak?.cancel()
    }

    func laadProducten() async {
        do {
            producten = try await Product.products(for: AbonnementProductID.alle)
        } catch {
            laadFout = error.localizedDescription
        }
    }

    func koop(_ product: Product) async {
        do {
            let resultaat = try await product.purchase()
            switch resultaat {
            case .success(let verificatie):
                if case .verified(let transactie) = verificatie {
                    await transactie.finish()
                    await werkAbonnementStatusBij()
                }
            case .userCancelled, .pending:
                break
            @unknown default:
                break
            }
        } catch {
            laadFout = error.localizedDescription
        }
    }

    func werkAbonnementStatusBij() async {
        var actief = false
        for await entitlement in Transaction.currentEntitlements {
            if case .verified(let transactie) = entitlement,
               AbonnementProductID.alle.contains(transactie.productID) {
                actief = true
            }
        }
        heeftPremium = actief
    }

    private func luisterNaarTransacties() -> Task<Void, Never> {
        Task.detached { [weak self] in
            for await update in Transaction.updates {
                guard case .verified(let transactie) = update else { continue }
                await transactie.finish()
                await self?.werkAbonnementStatusBij()
            }
        }
    }
}
