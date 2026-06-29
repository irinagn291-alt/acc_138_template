import Foundation

enum _GmBl0011Xy {
    static func _gm0037(from raw: String) -> [String] {
        guard let base = _gm0038(raw) else { return [] }
        var out = [base]
        if base.count == 12 { out.append("0" + base) }
        if base.count == 13, base.hasPrefix("0") { out.append(String(base.dropFirst())) }
        if base.count == 8 { out.append(String(repeating: "0", count: 5) + base) }
        var seen = Set<String>()
        return out.filter { seen.insert($0).inserted }
    }

    private static func _gm0038(_ raw: String) -> String? {
        let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        let digits = trimmed.filter(\.isNumber)
        if (8...14).contains(digits.count) { return digits }
        if digits.count > 14 { return String(digits.prefix(13)) }
        return nil
    }
}
