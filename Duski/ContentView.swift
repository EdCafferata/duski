import SwiftUI

/// Root-scherm: toont onboarding (leeftijdsgroep-keuze) bij eerste gebruik,
/// daarna het mixer-scherm.
struct ContentView: View {
    @State private var leeftijdsGroep: LeeftijdsGroep? = GebruikersVoorkeuren.leeftijdsGroep

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
    }
}

#Preview {
    ContentView()
}
