import SwiftUI

struct _GmBl0034Xy: View {
    @EnvironmentObject private var _gm0187: _GmBl0049Xy
    @State private var _gm0113: _GmBl0016Xy?
    @State private var _gm0114: UUID?

    var body: some View {
        VStack(spacing: 14) {
            _gm0115
            _gm0116
            _gm0117
        }
        .padding(.top, 18)
        .sheet(item: Binding(
            get: { _gm0114.flatMap { id in _gm0187._gm0166.first { $0.id == id } } },
            set: { _gm0114 = $0?.id }
        )) { item in
            _GmBl0033Xy(_gm0110: item.id)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }

    private var _gm0115: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("My pantry").font(_GmBl0009Xy._gm0015(26)).foregroundStyle(_GmBl0008Xy._gm0007)
            Text("\(_gm0187._gm0166.count) item\(_gm0187._gm0166.count == 1 ? "" : "s") stocked")
                .font(_GmBl0009Xy._gm0017(14)).foregroundStyle(_GmBl0008Xy._gm0008)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 22)
    }

    private var _gm0116: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                _gm0118(nil, "All", "tray.full.fill")
                ForEach(_GmBl0016Xy.allCases) { s in _gm0118(s, s.rawValue, s._gm0054) }
            }
            .padding(.horizontal, 22)
        }
    }

    private func _gm0118(_ value: _GmBl0016Xy?, _ label: String, _ icon: String) -> some View {
        let on = _gm0113 == value
        return Button { withAnimation { _gm0113 = value } } label: {
            Label(label, systemImage: icon)
                .font(_GmBl0009Xy._gm0018(13))
                .foregroundStyle(on ? .white : _GmBl0008Xy._gm0007)
                .padding(.horizontal, 14).padding(.vertical, 9)
                .background(Capsule().fill(on ? _GmBl0008Xy._gm0004 : _GmBl0008Xy._gm0002))
                .shadow(color: _GmBl0008Xy._gm0013.opacity(on ? 0 : 0.7), radius: 4, x: 2, y: 2)
        }
    }

    @ViewBuilder
    private var _gm0117: some View {
        let rows = _gm0113 == nil ? _gm0187._gm0166 : _gm0187._gm0166.filter { $0._gm0056 == _gm0113 }
        if rows.isEmpty {
            Spacer()
            _GmBl0047Xy(_gm0158: "basket", _gm0159: "Nothing here yet",
                         _gm0160: "Scan or search a product and add it to start stocking your kitchen.")
            Spacer()
        } else {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(rows) { item in
                        Button { _gm0114 = item.id } label: { _GmBl0035Xy(_gm0119: item) }
                            .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 22).padding(.top, 4).padding(.bottom, 24)
            }
        }
    }
}

private struct _GmBl0035Xy: View {
    let _gm0119: _GmBl0017Xy

    var body: some View {
        HStack(spacing: 14) {
            _GmBl0045Xy(_gm0153: _gm0119._gm0055._gm0051)
            VStack(alignment: .leading, spacing: 5) {
                Text(_gm0119._gm0055._gm0045)
                    .font(_GmBl0009Xy._gm0016(16)).foregroundStyle(_GmBl0008Xy._gm0007).lineLimit(1)
                HStack(spacing: 6) {
                    _GmBl0007Xy(_gm0027: _gm0120, _gm0028: _gm0121)
                    Label("\(_gm0119._gm0057)", systemImage: "number")
                        .font(_GmBl0009Xy._gm0018(11)).foregroundStyle(_GmBl0008Xy._gm0008)
                    if _gm0119._gm0059 {
                        Text("opened").font(_GmBl0009Xy._gm0018(11)).foregroundStyle(_GmBl0008Xy._gm0006)
                    }
                }
            }
            Spacer(minLength: 4)
            if _gm0119._gm0060 { Image(systemName: "star.fill").foregroundStyle(_GmBl0008Xy._gm0010) }
            Image(systemName: _gm0119._gm0056._gm0054).foregroundStyle(_GmBl0008Xy._gm0008)
        }
        .padding(12)._gm0024()
    }

    private var _gm0120: String {
        switch _gm0119._gm0064 {
        case ._ec0016: return _gm0119._gm0063.map { "\($0)d left" } ?? "fresh"
        case ._ec0017: return _gm0119._gm0063.map { $0 == 0 ? "today" : "\($0)d left" } ?? "soon"
        case ._ec0018: return "expired"
        case ._ec0019: return "no date"
        }
    }
    private var _gm0121: Color {
        switch _gm0119._gm0064 {
        case ._ec0016: return _GmBl0008Xy._gm0009
        case ._ec0017: return _GmBl0008Xy._gm0010
        case ._ec0018: return _GmBl0008Xy._gm0011
        case ._ec0019: return _GmBl0008Xy._gm0008
        }
    }
}
