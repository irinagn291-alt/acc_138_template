import Foundation

enum _GmBl0016Xy: String, Codable, CaseIterable, Identifiable {
    case _ec0009 = "Fridge"
    case _ec0010 = "Freezer"
    case _ec0011 = "Pantry"
    case _ec0012 = "Counter"

    var id: String { rawValue }
    var _gm0054: String {
        switch self {
        case ._ec0009: return "refrigerator"
        case ._ec0010: return "snowflake"
        case ._ec0011: return "cabinet"
        case ._ec0012: return "fork.knife"
        }
    }
}

struct _GmBl0017Xy: Identifiable, Codable, Hashable {
    let id: UUID
    let _gm0055: _GmBl0015Xy
    var _gm0056: _GmBl0016Xy
    var _gm0057: Int
    var _gm0058: Date?
    var _gm0059: Bool
    var _gm0060: Bool
    var _gm0061: String
    let _gm0062: Date

    init(
        provision: _GmBl0015Xy,
        spot: _GmBl0016Xy = ._ec0011,
        count: Int = 1,
        bestBefore: Date? = nil
    ) {
        self.id = UUID()
        self._gm0055 = provision
        self._gm0056 = spot
        self._gm0057 = count
        self._gm0058 = bestBefore
        self._gm0059 = false
        self._gm0060 = false
        self._gm0061 = ""
        self._gm0062 = Date()
    }

    var _gm0063: Int? {
        guard let _gm0058 else { return nil }
        return Calendar.current.dateComponents([.day], from: Calendar.current.startOfDay(for: Date()), to: Calendar.current.startOfDay(for: _gm0058)).day
    }

    enum _GmBl0018Xy { case _ec0016, _ec0017, _ec0018, _ec0019 }

    var _gm0064: _GmBl0018Xy {
        guard let d = _gm0063 else { return ._ec0019 }
        if d < 0 { return ._ec0018 }
        if d <= 3 { return ._ec0017 }
        return ._ec0016
    }

    enum CodingKeys: String, CodingKey {
        case id
        case _gm0055 = "provision"
        case _gm0056 = "spot"
        case _gm0057 = "count"
        case _gm0058 = "bestBefore"
        case _gm0059 = "opened"
        case _gm0060 = "starred"
        case _gm0061 = "note"
        case _gm0062 = "stockedOn"
    }
}
