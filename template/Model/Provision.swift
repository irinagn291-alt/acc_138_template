import Foundation

struct _GmBl0015Xy: Identifiable, Codable, Hashable {
    let _gm0044: String
    let _gm0045: String
    let _gm0046: String?
    let _gm0047: String?
    let _gm0048: String?
    let _gm0049: String?
    let _gm0050: String?

    var id: String { _gm0044 }

    var _gm0051: URL? { _gm0048.flatMap(URL.init(string:)) }

    var _gm0052: String? {
        _gm0049?.uppercased().first.map(String.init)
    }

    var _gm0053: String {
        [_gm0046, _gm0050].compactMap { $0 }.joined(separator: " · ")
    }

    enum CodingKeys: String, CodingKey {
        case _gm0044 = "code"
        case _gm0045 = "name"
        case _gm0046 = "brand"
        case _gm0047 = "category"
        case _gm0048 = "imageLink"
        case _gm0049 = "nutriScore"
        case _gm0050 = "netQuantity"
    }
}
