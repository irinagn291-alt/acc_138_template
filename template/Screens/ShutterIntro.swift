import SwiftUI

struct _GmBl0048Xy: View {
    @EnvironmentObject private var _gm0192: _GmBl0002Xy
    @State private var _gm0161 = false
    @State private var _gm0162 = false
    @State private var _gm0163 = false

    var body: some View {
        ZStack {
            _GmBl0008Xy._gm0001.ignoresSafeArea()
            VStack(spacing: 30) {
                Spacer()
                _gm0164
                VStack(spacing: 6) {
                    Text("Larder")
                        .font(_GmBl0009Xy._gm0015(40))
                        .foregroundStyle(_GmBl0008Xy._gm0005)
                    Text("your kitchen, kept fresh")
                        .font(_GmBl0009Xy._gm0017(15))
                        .foregroundStyle(_GmBl0008Xy._gm0008)
                }
                .opacity(_gm0163 ? 1 : 0)
                .offset(y: _gm0163 ? 0 : 16)
                Spacer()
            }
        }
        .onAppear(perform: _gm0165)
    }

    private var _gm0164: some View {
        ZStack {
            Circle()
                .fill(_GmBl0008Xy._gm0002)
                .frame(width: 150, height: 150)
                .shadow(color: _GmBl0008Xy._gm0013.opacity(0.9), radius: 12, x: 8, y: 8)
                .shadow(color: _GmBl0008Xy._gm0012, radius: 12, x: -8, y: -8)

            Image(systemName: "basket.fill")
                .font(.system(size: 60, weight: .semibold))
                .foregroundStyle(_GmBl0008Xy._gm0004)
                .scaleEffect(_gm0161 ? 1 : 0.4)
                .offset(y: _gm0161 ? 0 : 20)

            ForEach(0..<5, id: \.self) { i in
                Circle()
                    .fill([_GmBl0008Xy._gm0006, _GmBl0008Xy._gm0004, _GmBl0008Xy._gm0010][i % 3])
                    .frame(width: 14, height: 14)
                    .offset(
                        x: CGFloat([-40, -18, 6, 28, 46][i]),
                        y: _gm0162 ? CGFloat([-58, -70, -64, -72, -60][i]) : 10
                    )
                    .opacity(_gm0162 ? 1 : 0)
            }
        }
    }

    private func _gm0165() {
        withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) { _gm0161 = true }
        withAnimation(.spring(response: 0.7, dampingFraction: 0.55).delay(0.25)) { _gm0162 = true }
        withAnimation(.easeOut(duration: 0.5).delay(0.6)) { _gm0163 = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) { _gm0192._gm0031() }
    }
}
