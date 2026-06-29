import SwiftUI

struct _GmBl0050Xy: View {
    @EnvironmentObject private var _gm0183: _GmBl0002Xy

    var body: some View {
        ZStack {
            _GmBl0008Xy._gm0001.ignoresSafeArea()
            switch _gm0183._gm0029 {
            case ._ec0001: _GmBl0048Xy()
            case ._ec0002: _GmBl0036Xy()
            case ._ec0003: _GmBl0030Xy()
            }
        }
        .preferredColorScheme(.light)
        .tint(_GmBl0008Xy._gm0004)
    }
}
