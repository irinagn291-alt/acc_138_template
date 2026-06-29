import SwiftUI

enum _GmBl0001Xy {
    case _ec0001
    case _ec0002
    case _ec0003
}

@MainActor
final class _GmBl0002Xy: ObservableObject {
    @Published var _gm0029: _GmBl0001Xy = ._ec0001
    @AppStorage("larder.primerDone") private var _gm0030 = false

    func _gm0031() {
        _gm0033(to: _gm0030 ? ._ec0003 : ._ec0002)
    }

    func _gm0032() {
        _gm0030 = true
        _gm0033(to: ._ec0003)
    }

    private func _gm0033(to next: _GmBl0001Xy) {
        withAnimation(.easeInOut(duration: 0.5)) { _gm0029 = next }
    }
}

@MainActor
final class _GmBl0003Xy: ObservableObject {
    let _gm0034: _GmBl0020Xy
    let _gm0035: _GmBl0049Xy
    let _gm0036: _GmBl0002Xy

    init(lookup: _GmBl0020Xy = _GmBl0021Xy()) {
        self._gm0034 = lookup
        self._gm0035 = _GmBl0049Xy()
        self._gm0036 = _GmBl0002Xy()
    }
}
