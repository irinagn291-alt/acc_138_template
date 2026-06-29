import SwiftUI

struct _GmBl0045Xy: View {
    let _gm0153: URL?
    var _gm0154: CGFloat = 58

    var body: some View {
        AsyncImage(url: _gm0153) { phase in
            if case .success(let img) = phase {
                img.resizable().scaledToFit().padding(6)
            } else {
                Image(systemName: "carrot.fill")
                    .font(.system(size: _gm0154 * 0.4))
                    .foregroundStyle(_GmBl0008Xy._gm0004.opacity(0.5))
            }
        }
        .frame(width: _gm0154, height: _gm0154)
        .background(RoundedRectangle(cornerRadius: _GmBl0010Xy._gm0020, style: .continuous).fill(_GmBl0008Xy._gm0001))
        .clipShape(RoundedRectangle(cornerRadius: _GmBl0010Xy._gm0020, style: .continuous))
    }
}

struct _GmBl0046Xy: View {
    let _gm0155: _GmBl0015Xy
    var _gm0156: Bool = false

    var body: some View {
        HStack(spacing: 14) {
            _GmBl0045Xy(_gm0153: _gm0155._gm0051)
            VStack(alignment: .leading, spacing: 4) {
                Text(_gm0155._gm0045)
                    .font(_GmBl0009Xy._gm0016(16)).foregroundStyle(_GmBl0008Xy._gm0007).lineLimit(2)
                if !_gm0155._gm0053.isEmpty {
                    Text(_gm0155._gm0053)
                        .font(_GmBl0009Xy._gm0017(13)).foregroundStyle(_GmBl0008Xy._gm0008).lineLimit(1)
                }
            }
            Spacer(minLength: 4)
            if let badge = _gm0155._gm0052 {
                Text(badge)
                    .font(_GmBl0009Xy._gm0016(13)).foregroundStyle(.white)
                    .frame(width: 26, height: 26)
                    .background(Circle().fill(_gm0157(badge)))
            }
            if _gm0156 {
                Image(systemName: "checkmark.circle.fill").foregroundStyle(_GmBl0008Xy._gm0004)
            }
        }
        .padding(12)
        ._gm0024()
    }

    private func _gm0157(_ grade: String) -> Color {
        switch grade {
        case "A": return _GmBl0008Xy._gm0009
        case "B": return _GmBl0008Xy._gm0004
        case "C": return _GmBl0008Xy._gm0010
        case "D": return _GmBl0008Xy._gm0006
        default: return _GmBl0008Xy._gm0011
        }
    }
}

struct _GmBl0047Xy: View {
    let _gm0158: String
    let _gm0159: String
    let _gm0160: String

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: _gm0158)
                .font(.system(size: 42)).foregroundStyle(_GmBl0008Xy._gm0008.opacity(0.6))
            Text(_gm0159).font(_GmBl0009Xy._gm0016(18)).foregroundStyle(_GmBl0008Xy._gm0007)
            Text(_gm0160)
                .font(_GmBl0009Xy._gm0017(14)).foregroundStyle(_GmBl0008Xy._gm0008)
                .multilineTextAlignment(.center).padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity).padding(.vertical, 36)
    }
}
