import Foundation
import Combine

@MainActor
final class _GmBl0049Xy: ObservableObject {
    @Published private(set) var _gm0166: [_GmBl0017Xy] = []

    private let _gm0167 = "larder.ledger.v1"
    private let _gm0168: UserDefaults

    init(store: UserDefaults = .standard) {
        self._gm0168 = store
        _gm0166 = _gm0176()
    }

    func _gm0169(code: String) -> Bool {
        _gm0166.contains { $0._gm0055._gm0044 == code }
    }

    func _gm0170(in spot: _GmBl0016Xy) -> [_GmBl0017Xy] {
        _gm0166.filter { $0._gm0056 == spot }
    }

    func _gm0171(within days: Int = 7) -> [_GmBl0017Xy] {
        _gm0166
            .filter { item in
                guard let d = item._gm0063 else { return false }
                return d <= days
            }
            .sorted { ($0._gm0063 ?? .max) < ($1._gm0063 ?? .max) }
    }

    @discardableResult
    func _gm0172(_ provision: _GmBl0015Xy, spot: _GmBl0016Xy = ._ec0011) -> _GmBl0017Xy {
        if let existing = _gm0166.first(where: { $0._gm0055._gm0044 == provision._gm0044 }) {
            return existing
        }
        let item = _GmBl0017Xy(provision: provision, spot: spot)
        _gm0166.insert(item, at: 0)
        _gm0175()
        return item
    }

    func _gm0173(_ item: _GmBl0017Xy) {
        _gm0166.removeAll { $0.id == item.id }
        _gm0175()
    }

    func _gm0174(_ item: _GmBl0017Xy, _ change: (inout _GmBl0017Xy) -> Void) {
        guard let i = _gm0166.firstIndex(where: { $0.id == item.id }) else { return }
        change(&_gm0166[i])
        _gm0175()
    }

    private func _gm0175() {
        if let blob = try? JSONEncoder().encode(_gm0166) { _gm0168.set(blob, forKey: _gm0167) }
    }

    private func _gm0176() -> [_GmBl0017Xy] {
        guard let blob = _gm0168.data(forKey: _gm0167),
              let decoded = try? JSONDecoder().decode([_GmBl0017Xy].self, from: blob) else { return [] }
        return decoded
    }
}
