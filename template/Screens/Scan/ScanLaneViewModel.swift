import SwiftUI

@MainActor
final class _GmBl0039Xy: ObservableObject {
    enum _GmBl0040Xy: Equatable {
        case _ec0025
        case _ec0026(String)
        case _ec0027(_GmBl0015Xy)
        case _ec0028(String)
    }

    @Published private(set) var _gm0136: _GmBl0040Xy = ._ec0025
    private let _gm0137: _GmBl0020Xy
    private var _gm0138: String?

    init(lookup: _GmBl0020Xy) { self._gm0137 = lookup }

    func _gm0139(_ raw: String) {
        let variants = _GmBl0011Xy._gm0037(from: raw)
        guard let primary = variants.first, primary != _gm0138 else { return }
        _gm0138 = primary

        Task {
            _gm0136 = ._ec0026(primary)
            for candidate in variants {
                if let hit = try? await _gm0137._gm0065(candidate) {
                    _gm0136 = ._ec0027(hit)
                    return
                }
            }
            _gm0136 = ._ec0028(primary)
        }
    }

    func _gm0140() {
        _gm0138 = nil
        _gm0136 = ._ec0025
    }
}
