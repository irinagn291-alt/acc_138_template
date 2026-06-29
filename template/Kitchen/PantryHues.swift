import SwiftUI

enum _GmBl0008Xy {
    static let _gm0001 = _gm0014("EEF4F0")
    static let _gm0002 = _gm0014("FFFFFF")
    static let _gm0003 = _gm0014("E2EAE5")

    static let _gm0004 = _gm0014("2BB673")
    static let _gm0005 = _gm0014("0E7C66")
    static let _gm0006 = _gm0014("FF8A5B")

    static let _gm0007 = _gm0014("14241D")
    static let _gm0008 = _gm0014("6B8077")

    static let _gm0009 = _gm0014("2BB673")
    static let _gm0010 = _gm0014("F2A100")
    static let _gm0011 = _gm0014("E5533D")

    static let _gm0012 = Color.white
    static let _gm0013 = _gm0014("C7D4CD")

    static func _gm0014(_ hex: String) -> Color {
        var s = hex; if s.hasPrefix("#") { s.removeFirst() }
        var v: UInt64 = 0; Scanner(string: s).scanHexInt64(&v)
        return Color(
            .sRGB,
            red: Double((v >> 16) & 0xFF) / 255,
            green: Double((v >> 8) & 0xFF) / 255,
            blue: Double(v & 0xFF) / 255,
            opacity: 1
        )
    }
}

enum _GmBl0009Xy {
    static func _gm0015(_ s: CGFloat) -> Font { .system(size: s, weight: .bold, design: .default) }
    static func _gm0016(_ s: CGFloat) -> Font { .system(size: s, weight: .semibold, design: .default) }
    static func _gm0017(_ s: CGFloat) -> Font { .system(size: s, weight: .regular, design: .default) }
    static func _gm0018(_ s: CGFloat) -> Font { .system(size: s, weight: .medium, design: .rounded) }
}

enum _GmBl0010Xy {
    static let _gm0019: CGFloat = 22
    static let _gm0020: CGFloat = 14
    static let _gm0021: CGFloat = 18
}
