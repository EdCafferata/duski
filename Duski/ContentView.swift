import SwiftUI
import StoreKit

/// Root-scherm: toont onboarding (leeftijdsgroep-keuze) bij eerste gebruik,
/// daarna het mixer-scherm.
struct ContentView: View {
    @State private var leeftijdsGroep: LeeftijdsGroep? = GebruikersVoorkeuren.leeftijdsGroep
    @Environment(\.requestReview) private var requestReview

    var body: some View {
        Group {
            if let groep = leeftijdsGroep {
                MixerView(leeftijdsGroep: groep, onWijzigGroep: { leeftijdsGroep = nil })
            } else {
                OnboardingView(onGekozen: { groep in
                    GebruikersVoorkeuren.leeftijdsGroep = groep
                    leeftijdsGroep = groep
                })
            }
        }
        .task {
            // Beoordelingsverzoek alleen bij app-start, nooit tijdens het inslapen.
            let magVragen = BeoordelingsVerzoek.magVragen
            BeoordelingsVerzoek.registreerAppStart()
            guard magVragen else { return }
            try? await Task.sleep(for: .seconds(2))
            requestReview()
            BeoordelingsVerzoek.markeerGevraagd()
        }
    }
}

#Preview {
    ContentView()
}
