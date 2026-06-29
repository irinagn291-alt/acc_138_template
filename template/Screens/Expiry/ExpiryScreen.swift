import SwiftUI

struct _GmBl0025Xy: View {
    @EnvironmentObject private var _gm0184: _GmBl0049Xy
    @State private var _gm0082: UUID?

    var body: some View {
        VStack(spacing: 14) {
            _gm0083
            _gm0084
        }
        .padding(.top, 18)
        .sheet(item: Binding(
            get: { _gm0082.flatMap { id in _gm0184._gm0166.first { $0.id == id } } },
            set: { _gm0082 = $0?.id }
        )) { item in
            _GmBl0033Xy(_gm0110: item.id)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }

    private var _gm0083: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Use soon").font(_GmBl0009Xy._gm0015(26)).foregroundStyle(_GmBl0008Xy._gm0007)
            Text("Cook these before they turn").font(_GmBl0009Xy._gm0017(14)).foregroundStyle(_GmBl0008Xy._gm0008)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 22)
    }

    @ViewBuilder
    private var _gm0084: some View {
        let rows = _gm0184._gm0171(within: 14)
        if rows.isEmpty {
            Spacer()
            _GmBl0047Xy(_gm0158: "checkmark.seal.fill", _gm0159: "All fresh",
                         _gm0160: "Nothing is close to expiring. Add best-before dates to track items here.")
            Spacer()
        } else {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(rows) { item in
                        Button { _gm0082 = item.id } label: { _GmBl0026Xy(_gm0085: item) }
                            .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 22).padding(.top, 4).padding(.bottom, 24)
            }
        }
    }
}

private struct _GmBl0026Xy: View {
    let _gm0085: _GmBl0017Xy

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle().fill(_gm0086.opacity(0.18)).frame(width: 52, height: 52)
                Text(_gm0087).font(_GmBl0009Xy._gm0016(15)).foregroundStyle(_gm0086)
            }
            VStack(alignment: .leading, spacing: 3) {
                Text(_gm0085._gm0055._gm0045).font(_GmBl0009Xy._gm0016(16)).foregroundStyle(_GmBl0008Xy._gm0007).lineLimit(1)
                Text(_gm0085._gm0056.rawValue).font(_GmBl0009Xy._gm0017(13)).foregroundStyle(_GmBl0008Xy._gm0008)
            }
            Spacer()
            _GmBl0045Xy(_gm0153: _gm0085._gm0055._gm0051, _gm0154: 46)
        }
        .padding(12)._gm0024()
    }

    private var _gm0086: Color {
        switch _gm0085._gm0064 {
        case ._ec0018: return _GmBl0008Xy._gm0011
        case ._ec0017: return _GmBl0008Xy._gm0010
        default: return _GmBl0008Xy._gm0009
        }
    }
    private var _gm0087: String {
        guard let d = _gm0085._gm0063 else { return "—" }
        if d < 0 { return "exp" }
        if d == 0 { return "now" }
        return "\(d)d"
    }
}
