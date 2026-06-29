import SwiftUI

struct _GmBl0032Xy: View {
    let _gm0104: _GmBl0015Xy

    @EnvironmentObject private var _gm0188: _GmBl0049Xy
    @Environment(\.dismiss) private var _gm0193

    @State private var _gm0105: _GmBl0016Xy = ._ec0011
    @State private var _gm0106 = 1
    @State private var _gm0107 = false
    @State private var _gm0108 = Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date()

    var body: some View {
        ZStack {
            _GmBl0008Xy._gm0001.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    _GmBl0046Xy(_gm0155: _gm0104)
                        .padding(.top, 8)

                    _gm0109("Where does it live?") {
                        let cols = [GridItem(.adaptive(minimum: 90), spacing: 10)]
                        LazyVGrid(columns: cols, spacing: 10) {
                            ForEach(_GmBl0016Xy.allCases) { s in
                                Button { _gm0105 = s } label: {
                                    VStack(spacing: 6) {
                                        Image(systemName: s._gm0054).font(.system(size: 18))
                                        Text(s.rawValue).font(_GmBl0009Xy._gm0018(12))
                                    }
                                    .foregroundStyle(_gm0105 == s ? .white : _GmBl0008Xy._gm0007)
                                    .frame(maxWidth: .infinity).padding(.vertical, 14)
                                    .background(RoundedRectangle(cornerRadius: 16).fill(_gm0105 == s ? _GmBl0008Xy._gm0004 : _GmBl0008Xy._gm0002))
                                }
                            }
                        }
                    }

                    _gm0109("How many?") {
                        HStack {
                            Stepper(value: $_gm0106, in: 1...99) {
                                Text("\(_gm0106) on the shelf").font(_GmBl0009Xy._gm0017(15)).foregroundStyle(_GmBl0008Xy._gm0007)
                            }
                        }
                        .padding(.horizontal, 14).padding(.vertical, 6)
                    }

                    _gm0109("Best before") {
                        VStack(spacing: 10) {
                            Toggle("Track a date", isOn: $_gm0107.animation())
                                .font(_GmBl0009Xy._gm0017(15)).tint(_GmBl0008Xy._gm0004)
                            if _gm0107 {
                                DatePicker("", selection: $_gm0108, displayedComponents: .date)
                                    .datePickerStyle(.graphical).tint(_GmBl0008Xy._gm0004)
                            }
                        }
                        .padding(.horizontal, 14).padding(.vertical, 6)
                    }

                    Button("Add to pantry") {
                        let item = _gm0188._gm0172(_gm0104, spot: _gm0105)
                        _gm0188._gm0174(item) {
                            $0._gm0056 = _gm0105
                            $0._gm0057 = _gm0106
                            $0._gm0058 = _gm0107 ? _gm0108 : nil
                        }
                        _gm0193()
                    }
                    .buttonStyle(_GmBl0006Xy())
                }
                .padding(22)
            }
        }
    }

    private func _gm0109<C: View>(_ title: String, @ViewBuilder _ c: () -> C) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title).font(_GmBl0009Xy._gm0016(15)).foregroundStyle(_GmBl0008Xy._gm0007)
            c()._gm0024()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
