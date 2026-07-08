import SwiftUI

/// Onderzoek toont dat alle geteste witte-ruismachines voor baby's op vol volume
/// de door ziekenhuizen aanbevolen geluidsniveaus overschreden (zie
/// onderzoek/01_demografie_wetenschap_appstore.md). Deze banner maakt de
/// ingebouwde volumelimiet zichtbaar in plaats van een verborgen instelling.
struct VeiligheidsBanner: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "ear.badge.waveform")
                .foregroundStyle(.orange)
            VStack(alignment: .leading, spacing: 4) {
                Text("Veilig volume voor je baby")
                    .font(.subheadline.weight(.semibold))
                Text("Het volume is begrensd en het toestel hoort minstens 2 meter van de baby vandaan te staan, volgens AAP-richtlijnen.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .background(.orange.opacity(0.12), in: .rect(cornerRadius: 16))
    }
}

#Preview {
    VeiligheidsBanner()
}
