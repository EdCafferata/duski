import SwiftUI

/// Grote kaart bovenaan het hoofdscherm met de "Voor jou"-mix van de leeftijdsgroep.
struct VoorJouKaart: View {
    let groep: LeeftijdsGroep
    @ObservedObject var mixer: GeluidsMixer

    private var mix: VoorJouMix { VoorJouMix.voor(groep) }
    private var groot: Bool { groep == .oudere }

    var body: some View {
        let speelt = mixer.voorJouActief
        Button {
            if speelt { mixer.stopAlles() } else { mixer.speelVoorJou(mix) }
        } label: {
            HStack(spacing: 14) {
                Text(mix.emoji)
                    .font(.system(size: groot ? 44 : 36))
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 6) {
                        Text("Voor jou")
                            .font((groot ? Font.subheadline : .caption).weight(.bold))
                            .textCase(.uppercase)
                            .foregroundStyle(.tint)
                        Text("Gratis")
                            .font(.caption2.weight(.semibold))
                            .padding(.horizontal, 6).padding(.vertical, 2)
                            .background(.tint.opacity(0.18), in: .capsule)
                    }
                    Text(mix.titel)
                        .font(groot ? .title2.weight(.bold) : .headline)
                        .multilineTextAlignment(.leading)
                    Text(mix.uitleg)
                        .font(groot ? .body : .footnote)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer(minLength: 0)
                Image(systemName: speelt ? "stop.fill" : "play.fill")
                    .font(.system(size: groot ? 26 : 20, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(width: groot ? 64 : 52, height: groot ? 64 : 52)
                    .background(.tint, in: .circle)
                    .accessibilityHidden(true)
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(speelt ? AnyShapeStyle(.tint.opacity(0.25)) : AnyShapeStyle(.thinMaterial), in: .rect(cornerRadius: 20))
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text(speelt ? "Stop \(mix.titel)" : "Speel \(mix.titel)"))
        .accessibilityIdentifier("voorJouKaart")
    }
}
