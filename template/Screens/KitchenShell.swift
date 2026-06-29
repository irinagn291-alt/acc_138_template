import SwiftUI

struct _GmBl0030Xy: View {
    @State private var _gm0099: _GmBl0031Xy = ._ec0006

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                _GmBl0008Xy._gm0001.ignoresSafeArea()
                _gm0100
            }
            _gm0101
        }
        .background(_GmBl0008Xy._gm0001.ignoresSafeArea())
    }

    @ViewBuilder
    private var _gm0100: some View {
        switch _gm0099 {
        case ._ec0004: _GmBl0027Xy()
        case ._ec0005: _GmBl0038Xy()
        case ._ec0006: _GmBl0034Xy()
        case ._ec0007: _GmBl0025Xy()
        case ._ec0008: _GmBl0043Xy()
        }
    }

    private var _gm0101: some View {
        HStack(spacing: 0) {
            ForEach(_GmBl0031Xy.allCases, id: \.self) { item in
                let on = item == _gm0099
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) { _gm0099 = item }
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: item._gm0102)
                            .font(.system(size: 19, weight: on ? .bold : .regular))
                        Text(item._gm0103).font(_GmBl0009Xy._gm0018(10))
                    }
                    .foregroundStyle(on ? _GmBl0008Xy._gm0004 : _GmBl0008Xy._gm0008)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(_GmBl0008Xy._gm0002)
                .shadow(color: _GmBl0008Xy._gm0013.opacity(0.8), radius: 10, y: -2)
        )
        .padding(.horizontal, 12)
        .padding(.bottom, 6)
    }
}

enum _GmBl0031Xy: CaseIterable {
    case _ec0004, _ec0005, _ec0006, _ec0007, _ec0008

    var _gm0102: String {
        switch self {
        case ._ec0004: return "magnifyingglass"
        case ._ec0005: return "barcode.viewfinder"
        case ._ec0006: return "square.grid.2x2.fill"
        case ._ec0007: return "clock.badge.exclamationmark"
        case ._ec0008: return "slider.horizontal.3"
        }
    }
    var _gm0103: String {
        switch self {
        case ._ec0004: return "Find"
        case ._ec0005: return "Scan"
        case ._ec0006: return "Pantry"
        case ._ec0007: return "Use soon"
        case ._ec0008: return "More"
        }
    }
}
