import Foundation

private func _sd(_ b: String) -> String {
    String(data: Data(base64Encoded: b) ?? Data(), encoding: .utf8) ?? ""
}

enum _GmBl0019Xy: LocalizedError {
    case _ec0013
    case _ec0014
    case _ec0015

    var errorDescription: String? {
        switch self {
        case ._ec0013: return "That doesn't look like a valid search."
        case ._ec0014: return "Couldn't reach the food database."
        case ._ec0015: return "No groceries matched."
        }
    }
}

protocol _GmBl0020Xy: Sendable {
    func _gm0065(_ code: String) async throws -> _GmBl0015Xy
    func _gm0066(_ text: String) async throws -> [_GmBl0015Xy]
}

final class _GmBl0021Xy: _GmBl0020Xy, Sendable {
    private let _gm0067 = _sd("TGFyZGVyQXBwLzEuMCAoY29udGFjdEBsYXJkZXIuYXBwKQ==")
    private let _gm0068 = _sd("Y29kZSxwcm9kdWN0X25hbWUsYnJhbmRzLGNhdGVnb3JpZXMsaW1hZ2VfZnJvbnRfc21hbGxfdXJsLG51dHJpc2NvcmVfZ3JhZGUscXVhbnRpdHk=")
    private let _gm0069: URLSession

    init(session: URLSession = .shared) {
        self._gm0069 = session
    }

    func _gm0065(_ code: String) async throws -> _GmBl0015Xy {
        let digits = code.filter(\.isNumber)
        guard digits.count >= 8 else { throw _GmBl0019Xy._ec0013 }
        let _base = _sd("aHR0cHM6Ly93b3JsZC5vcGVuZm9vZGZhY3RzLm9yZy9hcGkvdjIvcHJvZHVjdC8=")
        let url = URL(string: "\(_base)\(digits).json?fields=\(_gm0068)")!
        let data = try await _gm0070(url)
        let envelope = try JSONDecoder().decode(_GmBl0022Xy.self, from: data)
        guard envelope._gm0071 == 1, let raw = envelope._gm0072 else { throw _GmBl0019Xy._ec0015 }
        return raw._gm0081(fallbackCode: digits)
    }

    func _gm0066(_ text: String) async throws -> [_GmBl0015Xy] {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { throw _GmBl0019Xy._ec0013 }
        let _base = _sd("aHR0cHM6Ly93b3JsZC5vcGVuZm9vZGZhY3RzLm9yZy9jZ2kvc2VhcmNoLnBs")
        guard var comps = URLComponents(string: _base) else {
            throw _GmBl0019Xy._ec0014
        }
        comps.queryItems = [
            URLQueryItem(name: "search_terms", value: trimmed),
            URLQueryItem(name: "search_simple", value: "1"),
            URLQueryItem(name: "action", value: "process"),
            URLQueryItem(name: "json", value: "1"),
            URLQueryItem(name: "page_size", value: "24"),
            URLQueryItem(name: "fields", value: _gm0068)
        ]
        guard let url = comps.url else { throw _GmBl0019Xy._ec0014 }
        let data = try await _gm0070(url)
        let page = try JSONDecoder().decode(_GmBl0023Xy.self, from: data)
        let mapped = (page._gm0073 ?? [])
            .filter { ($0._gm0075 ?? "").isEmpty == false }
            .map { $0._gm0081(fallbackCode: $0._gm0074 ?? "") }
        if mapped.isEmpty { throw _GmBl0019Xy._ec0015 }
        return mapped
    }

    private func _gm0070(_ url: URL) async throws -> Data {
        var req = URLRequest(url: url)
        req.setValue(_gm0067, forHTTPHeaderField: "User-Agent")
        guard
            let (data, resp) = try? await _gm0069.data(for: req),
            let http = resp as? HTTPURLResponse, (200..<300).contains(http.statusCode)
        else { throw _GmBl0019Xy._ec0014 }
        return data
    }
}

// MARK: - Wire models

private struct _GmBl0022Xy: Decodable {
    let _gm0071: Int
    let _gm0072: _GmBl0024Xy?

    enum CodingKeys: String, CodingKey {
        case _gm0071 = "status"
        case _gm0072 = "product"
    }
}

private struct _GmBl0023Xy: Decodable {
    let _gm0073: [_GmBl0024Xy]?

    enum CodingKeys: String, CodingKey {
        case _gm0073 = "products"
    }
}

private struct _GmBl0024Xy: Decodable {
    let _gm0074: String?
    let _gm0075: String?
    let _gm0076: String?
    let _gm0077: String?
    let _gm0078: String?
    let _gm0079: String?
    let _gm0080: String?

    enum CodingKeys: String, CodingKey {
        case _gm0074 = "code"
        case _gm0075 = "product_name"
        case _gm0076 = "brands"
        case _gm0077 = "categories"
        case _gm0078 = "image_front_small_url"
        case _gm0079 = "nutriscore_grade"
        case _gm0080 = "quantity"
    }

    func _gm0081(fallbackCode: String) -> _GmBl0015Xy {
        _GmBl0015Xy(
            _gm0044: _gm0074 ?? fallbackCode,
            _gm0045: (_gm0075?.isEmpty == false ? _gm0075! : "Unnamed item"),
            _gm0046: _gm0076?.split(separator: ",").first.map { $0.trimmingCharacters(in: .whitespaces) },
            _gm0047: _gm0077?.split(separator: ",").first.map { $0.trimmingCharacters(in: .whitespaces) },
            _gm0048: _gm0078,
            _gm0049: _gm0079,
            _gm0050: _gm0080
        )
    }
}
