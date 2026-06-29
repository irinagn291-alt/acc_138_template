import SwiftUI
import StoreKit

private func _sd(_ b: String) -> String {
    String(data: Data(base64Encoded: b) ?? Data(), encoding: .utf8) ?? ""
}

struct _GmBl0043Xy: View {
    @EnvironmentObject private var _gm0190: _GmBl0049Xy
    @Environment(\.requestReview) private var _gm0196
    @State private var _gm0144: _GmBl0044Xy?

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                _gm0145
                _gm0146
                _gm0147
                _gm0148
            }
            .padding(22)
            .padding(.top, 18)
        }
        .background(_GmBl0008Xy._gm0001)
        .sheet(item: $_gm0144) { page in
            _GmBl0041Xy(_gm0141: page._gm0151, _gm0142: page._gm0152)
        }
    }

    private var _gm0145: some View {
        VStack(spacing: 10) {
            ZStack {
                Circle().fill(_GmBl0008Xy._gm0004).frame(width: 70, height: 70)
                Image(systemName: "basket.fill").font(.system(size: 30)).foregroundStyle(.white)
            }
            Text("Larder").font(_GmBl0009Xy._gm0015(24)).foregroundStyle(_GmBl0008Xy._gm0007)
            Text("Version 1.0").font(_GmBl0009Xy._gm0018(12)).foregroundStyle(_GmBl0008Xy._gm0008)
        }
        .frame(maxWidth: .infinity).padding(.vertical, 20)._gm0024()
    }

    private var _gm0146: some View {
        HStack(spacing: 12) {
            _gm0149("\(_gm0190._gm0166.count)", "Items")
            _gm0149("\(_gm0190._gm0171(within: 7).count)", "Use soon")
            _gm0149("\(_gm0190._gm0166.filter { $0._gm0060 }.count)", "Starred")
        }
    }

    private func _gm0149(_ v: String, _ l: String) -> some View {
        VStack(spacing: 4) {
            Text(v).font(_GmBl0009Xy._gm0015(22)).foregroundStyle(_GmBl0008Xy._gm0005)
            Text(l).font(_GmBl0009Xy._gm0018(11)).foregroundStyle(_GmBl0008Xy._gm0008)
        }
        .frame(maxWidth: .infinity).padding(.vertical, 16)._gm0024(18)
    }

    private var _gm0147: some View {
        VStack(spacing: 0) {
            _gm0150("envelope.fill", "Contact us", _GmBl0008Xy._gm0004) { _gm0144 = ._ec0029 }
            Divider().padding(.leading, 50)
            _gm0150("star.fill", "Rate Larder", _GmBl0008Xy._gm0010) { _gm0196() }
            Divider().padding(.leading, 50)
            _gm0150("hand.raised.fill", "Privacy policy", _GmBl0008Xy._gm0006) { _gm0144 = ._ec0030 }
        }
        ._gm0024()
    }

    private func _gm0150(_ icon: String, _ title: String, _ tint: Color, _ act: @escaping () -> Void) -> some View {
        Button(action: act) {
            HStack(spacing: 12) {
                Image(systemName: icon).foregroundStyle(tint).frame(width: 24)
                Text(title).font(_GmBl0009Xy._gm0017(16)).foregroundStyle(_GmBl0008Xy._gm0007)
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 12, weight: .bold)).foregroundStyle(_GmBl0008Xy._gm0008)
            }
            .padding(.horizontal, 16).padding(.vertical, 15)
        }
    }

    private var _gm0148: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Product data and images come from Open Food Facts, a collaborative, free food products database.")
                .font(_GmBl0009Xy._gm0017(13)).foregroundStyle(_GmBl0008Xy._gm0008).lineSpacing(3)
            Link(destination: URL(string: "https://world.openfoodfacts.org")!) {
                HStack(spacing: 4) {
                    Text("About Open Food Facts").font(_GmBl0009Xy._gm0018(13))
                    Image(systemName: "arrow.up.right").font(.system(size: 11, weight: .bold))
                }.foregroundStyle(_GmBl0008Xy._gm0004)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading).padding(16)._gm0024()
    }
}

private enum _GmBl0044Xy: Identifiable {
    case _ec0029, _ec0030
    var id: String { _gm0151 }
    var _gm0151: String { self == ._ec0029 ? "Contact" : "Privacy" }
    var _gm0152: String {
        self == ._ec0029
            ? _sd("aHR0cHM6Ly9uZXctZ2V0bGFyZGVyLnByby9jb250YWN0")
            : _sd("aHR0cHM6Ly9uZXctZ2V0bGFyZGVyLnByby9wcml2YWN5")
    }
}
