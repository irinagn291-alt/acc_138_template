import SwiftUI

struct _GmBl0004Xy: ViewModifier {
    var _gm0022: CGFloat = _GmBl0010Xy._gm0019
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: _gm0022, style: .continuous)
                    .fill(_GmBl0008Xy._gm0002)
            )
            .shadow(color: _GmBl0008Xy._gm0013.opacity(0.9), radius: 8, x: 6, y: 6)
            .shadow(color: _GmBl0008Xy._gm0012.opacity(0.9), radius: 8, x: -6, y: -6)
    }
}

struct _GmBl0005Xy: ViewModifier {
    var _gm0023: CGFloat = _GmBl0010Xy._gm0020
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: _gm0023, style: .continuous)
                    .fill(_GmBl0008Xy._gm0003)
            )
            .overlay(
                RoundedRectangle(cornerRadius: _gm0023, style: .continuous)
                    .stroke(_GmBl0008Xy._gm0013.opacity(0.5), lineWidth: 1)
                    .blur(radius: 1)
                    .mask(RoundedRectangle(cornerRadius: _gm0023, style: .continuous))
            )
    }
}

extension View {
    func _gm0024(_ radius: CGFloat = _GmBl0010Xy._gm0019) -> some View {
        modifier(_GmBl0004Xy(radius: radius))
    }
    func _gm0025(_ radius: CGFloat = _GmBl0010Xy._gm0020) -> some View {
        modifier(_GmBl0005Xy(radius: radius))
    }
}

struct _GmBl0006Xy: ButtonStyle {
    var _gm0026: Color = _GmBl0008Xy._gm0004
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(_GmBl0009Xy._gm0016(17))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                Capsule().fill(LinearGradient(colors: [_gm0026, _gm0026.opacity(0.82)], startPoint: .top, endPoint: .bottom))
            )
            .shadow(color: _gm0026.opacity(configuration.isPressed ? 0.1 : 0.4), radius: configuration.isPressed ? 3 : 10, y: configuration.isPressed ? 1 : 6)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.spring(response: 0.25, dampingFraction: 0.7), value: configuration.isPressed)
    }
}

struct _GmBl0007Xy: View {
    let _gm0027: String
    let _gm0028: Color
    var body: some View {
        HStack(spacing: 5) {
            Circle().fill(_gm0028).frame(width: 7, height: 7)
            Text(_gm0027).font(_GmBl0009Xy._gm0018(11)).foregroundStyle(_GmBl0008Xy._gm0007)
        }
        .padding(.horizontal, 10).padding(.vertical, 5)
        .background(Capsule().fill(_gm0028.opacity(0.14)))
    }
}
