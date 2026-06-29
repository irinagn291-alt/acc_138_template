import SwiftUI

@MainActor
final class _GmBl0028Xy: ObservableObject {
    enum _GmBl0029Xy: Equatable {
        case _ec0020
        case _ec0021
        case _ec0022([_GmBl0015Xy])
        case _ec0023
        case _ec0024(String)
    }

    @Published var _gm0093 = ""
    @Published private(set) var _gm0094: _GmBl0029Xy = ._ec0020

    private let _gm0095: _GmBl0020Xy
    private var _gm0096: Task<Void, Never>?

    init(lookup: _GmBl0020Xy) { self._gm0095 = lookup }

    func _gm0097() {
        _gm0096?.cancel()
        guard !_gm0093.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        let q = _gm0093
        _gm0096 = Task {
            _gm0094 = ._ec0021
            do {
                let hits = try await _gm0095._gm0066(q)
                if Task.isCancelled { return }
                _gm0094 = hits.isEmpty ? ._ec0023 : ._ec0022(hits)
            } catch is CancellationError {
            } catch _GmBl0019Xy._ec0015 {
                if !Task.isCancelled { _gm0094 = ._ec0023 }
            } catch {
                if !Task.isCancelled { _gm0094 = ._ec0024(error.localizedDescription) }
            }
        }
    }

    func _gm0098() {
        _gm0096?.cancel(); _gm0093 = ""; _gm0094 = ._ec0020
    }
}
