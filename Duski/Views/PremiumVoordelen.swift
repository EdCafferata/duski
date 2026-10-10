import SwiftUI

/// De drie concrete voordelen van Premium, bovenaan de paywall.
struct PremiumVoordelen: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Label("Alle 26 geluiden", systemImage: "checkmark.circle.fill")
            Label("Onbeperkt mixen", systemImage: "checkmark.circle.fill")
            Label("Geen account, geen advertenties", systemImage: "checkmark.circle.fill")
        }
        .font(.subheadline)
        .symbolRenderingMode(.hierarchical)
    }
}

#Preview {
    PremiumVoordelen()
}
