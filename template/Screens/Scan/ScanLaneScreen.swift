import SwiftUI

struct _GmBl0038Xy: View {
    @EnvironmentObject private var _gm0186: _GmBl0049Xy
    @StateObject private var _gm0131 = _GmBl0039Xy(lookup: _GmBl0021Xy())
    @State private var _gm0132: _GmBl0015Xy?

    var body: some View {
        ZStack {
            if _GmBl0012Xy._gm0039 {
                _GmBl0013Xy { _gm0131._gm0139($0) }
                    .ignoresSafeArea()
                _gm0133
                _gm0134
            } else {
                _GmBl0047Xy(_gm0158: "camera.metering.unknown", _gm0159: "No camera",
                             _gm0160: "Scanning needs a device camera. Use Find instead.")
            }
        }
        .sheet(item: $_gm0132) { p in
            _GmBl0032Xy(_gm0104: p)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
    }

    private var _gm0133: some View {
        VStack {
            Text("Line up the barcode")
                .font(_GmBl0009Xy._gm0016(15)).foregroundStyle(.white)
                .padding(.horizontal, 14).padding(.vertical, 8)
                .background(Capsule().fill(.black.opacity(0.45)))
                .padding(.top, 70)
            Spacer()
            RoundedRectangle(cornerRadius: 18)
                .strokeBorder(_GmBl0008Xy._gm0004, lineWidth: 3)
                .frame(width: 250, height: 130)
            Spacer()
        }
    }

    @ViewBuilder
    private var _gm0134: some View {
        switch _gm0131._gm0136 {
        case ._ec0025:
            EmptyView()
        case ._ec0026(let code):
            _gm0135 { HStack(spacing: 12) {
                ProgressView().tint(_GmBl0008Xy._gm0004)
                Text("Looking up \(code)…").font(_GmBl0009Xy._gm0017(15)).foregroundStyle(_GmBl0008Xy._gm0007)
            } }
        case ._ec0027(let p):
            _gm0135 { VStack(spacing: 12) {
                _GmBl0046Xy(_gm0155: p, _gm0156: _gm0186._gm0169(code: p._gm0044))
                HStack(spacing: 10) {
                    Button("Add to shelf") { _gm0132 = p }
                        .buttonStyle(_GmBl0006Xy())
                    Button("Scan next") { _gm0131._gm0140() }
                        .buttonStyle(_GmBl0006Xy(_gm0026: _GmBl0008Xy._gm0008))
                }
            } }
        case ._ec0028(let code):
            _gm0135 { VStack(spacing: 10) {
                _GmBl0047Xy(_gm0158: "barcode", _gm0159: "Not in the database",
                             _gm0160: "\(code) isn't listed. You can still search by name.")
                Button("Scan again") { _gm0131._gm0140() }.buttonStyle(_GmBl0006Xy())
            } }
        }
    }

    private func _gm0135<C: View>(@ViewBuilder _ c: () -> C) -> some View {
        VStack { Spacer(); c().padding(16)._gm0024().padding(.horizontal, 16).padding(.bottom, 24)
            .transition(.move(edge: .bottom).combined(with: .opacity)) }
            .animation(.spring(response: 0.4, dampingFraction: 0.8), value: _gm0131._gm0136)
    }
}
