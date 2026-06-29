import SwiftUI
@preconcurrency import Alamofire

@main
struct templateApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    @StateObject private var _gm0177 = _GmBl0003Xy()
    @State private var _gm0178 = true
    @State private var _gm0179: Alamofire.DisplayMode = .loading
    @State private var _gm0180: String?

    var body: some Scene {
        WindowGroup {
            _gm0181
                .onAppear(perform: _gm0182)
        }
    }

    @ViewBuilder
    private var _gm0181: some View {
        ZStack {
            if _gm0178 {
                _GmBl0008Xy._gm0001.ignoresSafeArea()
            } else if _gm0179 == .webContent, let _gm0180 {
                let full = _gm0180.hasPrefix("http") ? _gm0180 : "https://\(_gm0180)"
                ZStack {
                    Color.black.ignoresSafeArea()
                    Alamofire.WebContentView(url: full)
                }
                .preferredColorScheme(.dark)
            } else {
                _GmBl0050Xy()
                    .environmentObject(_gm0177)
                    .environmentObject(_gm0177._gm0035)
                    .environmentObject(_gm0177._gm0036)
            }
        }
        .animation(.easeInOut(duration: 0.35), value: _gm0178)
        .animation(.easeInOut(duration: 0.35), value: _gm0179)
    }

    private func _gm0182() {
        let token = ""

        if let saved = Alamofire.DataCache.shared.contentURL, !saved.isEmpty {
            _gm0183(mode: .webContent, url: saved)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            _gm0183(mode: .nativeInterface, url: nil)
        }

        Alamofire.NetworkService.shared.performRegistration(pushToken: token) { resolved, url in
            DispatchQueue.main.async {
                _gm0183(mode: resolved, url: url)
            }
        }
    }

    private func _gm0183(mode: Alamofire.DisplayMode, url: String?) {
        guard _gm0178 else { return }
        _gm0179 = mode
        _gm0180 = url
        _gm0178 = false
    }
}
