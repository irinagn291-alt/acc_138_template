import SwiftUI

struct _GmBl0027Xy: View {
    @EnvironmentObject private var _gm0185: _GmBl0049Xy
    @StateObject private var _gm0089 = _GmBl0028Xy(lookup: _GmBl0021Xy())
    @State private var _gm0088: _GmBl0015Xy?

    var body: some View {
        VStack(spacing: 16) {
            _gm0090
            _gm0091
            _gm0092
        }
        .padding(.top, 18)
        .sheet(item: $_gm0088) { p in
            _GmBl0032Xy(_gm0104: p)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
    }

    private var _gm0090: some View {
        Text("Find a product")
            .font(_GmBl0009Xy._gm0015(26))
            .foregroundStyle(_GmBl0008Xy._gm0007)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 22)
    }

    private var _gm0091: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass").foregroundStyle(_GmBl0008Xy._gm0008)
            TextField("", text: $_gm0089._gm0093, prompt: Text("Oat milk, pasta, hummus…").foregroundStyle(_GmBl0008Xy._gm0008))
                .font(_GmBl0009Xy._gm0017(16)).foregroundStyle(_GmBl0008Xy._gm0007)
                .submitLabel(.search).autocorrectionDisabled()
                .onSubmit { _gm0089._gm0097() }
            if !_gm0089._gm0093.isEmpty {
                Button { _gm0089._gm0098() } label: {
                    Image(systemName: "xmark.circle.fill").foregroundStyle(_GmBl0008Xy._gm0008)
                }
            }
        }
        .padding(.horizontal, 16).padding(.vertical, 14)
        ._gm0025(_GmBl0010Xy._gm0019)
        .padding(.horizontal, 22)
    }

    @ViewBuilder
    private var _gm0092: some View {
        switch _gm0089._gm0094 {
        case ._ec0020:
            _GmBl0047Xy(_gm0158: "text.magnifyingglass", _gm0159: "Search the food database",
                         _gm0160: "Type a product name to find it, then add it to your shelves.")
            Spacer()
        case ._ec0021:
            Spacer(); ProgressView().tint(_GmBl0008Xy._gm0004).scaleEffect(1.2); Spacer()
        case ._ec0022(let items):
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(items) { p in
                        Button { _gm0088 = p } label: {
                            _GmBl0046Xy(_gm0155: p, _gm0156: _gm0185._gm0169(code: p._gm0044))
                        }.buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 22).padding(.top, 4).padding(.bottom, 24)
            }
        case ._ec0023:
            _GmBl0047Xy(_gm0158: "tray", _gm0159: "Nothing found",
                         _gm0160: "No groceries matched "\(_gm0089._gm0093)". Try a simpler term.")
            Spacer()
        case ._ec0024(let msg):
            _GmBl0047Xy(_gm0158: "wifi.slash", _gm0159: "Can't search", _gm0160: msg)
            Spacer()
        }
    }
}
