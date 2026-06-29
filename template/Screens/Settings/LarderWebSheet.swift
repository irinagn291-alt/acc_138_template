import SwiftUI
import WebKit

struct _GmBl0041Xy: View {
    let _gm0141: String
    let _gm0142: String
    @Environment(\.dismiss) private var _gm0195

    var body: some View {
        NavigationStack {
            _GmBl0042Xy(_gm0143: _gm0142)
                .ignoresSafeArea(edges: .bottom)
                .navigationTitle(_gm0141)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) { Button("Done") { _gm0195() } }
                }
        }
        .tint(_GmBl0008Xy._gm0004)
    }
}

private struct _GmBl0042Xy: UIViewRepresentable {
    let _gm0143: String
    func makeUIView(context: Context) -> WKWebView {
        let v = WKWebView()
        if let url = URL(string: _gm0143) { v.load(URLRequest(url: url)) }
        return v
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
