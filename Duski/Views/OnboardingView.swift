import SwiftUI

/// Eerste scherm: kies je leeftijdsgroep. Bepaalt content en veiligheidsgrenzen
/// (bv. volumelimiet bij Baby, zie onderzoek/00_PRODUCTCONCEPT.md).
struct OnboardingView: View {
    let onGekozen: (LeeftijdsGroep) -> Void

    var body: some View {
        VStack(spacing: 32) {
            VStack(spacing: 8) {
                Text("Duski")
                    .font(.system(.largeTitle, design: .rounded, weight: .bold))
                Text("Voor wie is dit toestel?")
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
            .padding(.top, 60)

            VStack(spacing: 14) {
                ForEach(LeeftijdsGroep.allCases) { groep in
                    Button {
                        onGekozen(groep)
                    } label: {
                        HStack {
                            Text(groep.emoji).font(.title2)
                            Text(groep.titel).font(.headline)
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.thinMaterial, in: .rect(cornerRadius: 20))
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 24)

            Spacer()
        }
    }
}

#Preview {
    OnboardingView(onGekozen: { _ in })
}
