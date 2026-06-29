import SwiftUI
import AVFoundation

struct _GmBl0036Xy: View {
    @EnvironmentObject private var _gm0191: _GmBl0002Xy
    @State private var _gm0122 = 0

    private let _gm0123: [_GmBl0037Xy] = [
        _GmBl0037Xy(_gm0127: "barcode.viewfinder", _gm0128: _GmBl0008Xy._gm0004,
               _gm0129: "Scan as you unpack",
               _gm0130: "Point Larder at any barcode and the product details fill themselves in."),
        _GmBl0037Xy(_gm0127: "square.grid.2x2.fill", _gm0128: _GmBl0008Xy._gm0005,
               _gm0129: "Know what lives where",
               _gm0130: "File each item in the fridge, freezer, pantry or counter so nothing hides at the back."),
        _GmBl0037Xy(_gm0127: "clock.badge.exclamationmark", _gm0128: _GmBl0008Xy._gm0006,
               _gm0129: "Use it before you lose it",
               _gm0130: "Set best-before dates and Larder surfaces what to cook next — less waste, more dinners.")
    ]

    var body: some View {
        VStack(spacing: 0) {
            _gm0124
            Spacer()
            _gm0125
            Spacer()
            _gm0126
        }
        .padding(.horizontal, 26)
        .padding(.vertical, 24)
        .background(_GmBl0008Xy._gm0001)
    }

    private var _gm0124: some View {
        HStack(spacing: 6) {
            ForEach(0...(_gm0123.count), id: \.self) { i in
                Capsule()
                    .fill(i <= _gm0122 ? _GmBl0008Xy._gm0004 : _GmBl0008Xy._gm0013)
                    .frame(height: 5)
            }
        }
        .padding(.top, 8)
    }

    @ViewBuilder
    private var _gm0125: some View {
        if _gm0122 < _gm0123.count {
            let p = _gm0123[_gm0122]
            VStack(spacing: 28) {
                ZStack {
                    Circle().fill(_GmBl0008Xy._gm0002)
                        .frame(width: 170, height: 170)
                        .shadow(color: _GmBl0008Xy._gm0013.opacity(0.9), radius: 12, x: 8, y: 8)
                        .shadow(color: _GmBl0008Xy._gm0012, radius: 12, x: -8, y: -8)
                    Image(systemName: p._gm0127)
                        .font(.system(size: 66, weight: .semibold))
                        .foregroundStyle(p._gm0128)
                }
                VStack(spacing: 12) {
                    Text(p._gm0129)
                        .font(_GmBl0009Xy._gm0015(26))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(_GmBl0008Xy._gm0007)
                    Text(p._gm0130)
                        .font(_GmBl0009Xy._gm0017(16))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(_GmBl0008Xy._gm0008)
                        .lineSpacing(4)
                }
            }
            .transition(.asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity),
                                    removal: .move(edge: .leading).combined(with: .opacity)))
            .id(_gm0122)
        } else {
            VStack(spacing: 28) {
                ZStack {
                    Circle().fill(_GmBl0008Xy._gm0002)
                        .frame(width: 170, height: 170)
                        .shadow(color: _GmBl0008Xy._gm0013.opacity(0.9), radius: 12, x: 8, y: 8)
                        .shadow(color: _GmBl0008Xy._gm0012, radius: 12, x: -8, y: -8)
                    Image(systemName: "camera.fill")
                        .font(.system(size: 60, weight: .semibold))
                        .foregroundStyle(_GmBl0008Xy._gm0006)
                }
                VStack(spacing: 12) {
                    Text("Ready to scan")
                        .font(_GmBl0009Xy._gm0015(26))
                        .foregroundStyle(_GmBl0008Xy._gm0007)
                    Text("Larder only opens the camera while you're scanning a barcode. Photos are never stored.")
                        .font(_GmBl0009Xy._gm0017(16))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(_GmBl0008Xy._gm0008)
                        .lineSpacing(4)
                }
            }
            .transition(.opacity)
        }
    }

    private var _gm0126: some View {
        VStack(spacing: 14) {
            Button(_gm0122 < _gm0123.count ? "Continue" : "Get started") {
                if _gm0122 < _gm0123.count {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) { _gm0122 += 1 }
                } else {
                    AVCaptureDevice.requestAccess(for: .video) { _ in
                        DispatchQueue.main.async { _gm0191._gm0032() }
                    }
                }
            }
            .buttonStyle(_GmBl0006Xy(_gm0026: _gm0122 < _gm0123.count ? _GmBl0008Xy._gm0004 : _GmBl0008Xy._gm0006))

            Button("Skip for now") { _gm0191._gm0032() }
                .font(_GmBl0009Xy._gm0018(14))
                .foregroundStyle(_GmBl0008Xy._gm0008)
        }
    }
}

private struct _GmBl0037Xy {
    let _gm0127: String
    let _gm0128: Color
    let _gm0129: String
    let _gm0130: String
}
