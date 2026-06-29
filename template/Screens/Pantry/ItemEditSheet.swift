import SwiftUI

struct _GmBl0033Xy: View {
    let _gm0110: UUID

    @EnvironmentObject private var _gm0189: _GmBl0049Xy
    @Environment(\.dismiss) private var _gm0194

    var body: some View {
        ZStack {
            _GmBl0008Xy._gm0001.ignoresSafeArea()
            if let item = _gm0189._gm0166.first(where: { $0.id == _gm0110 }) {
                _gm0111(item)
            } else {
                _GmBl0047Xy(_gm0158: "trash", _gm0159: "Removed", _gm0160: "This item is no longer in your pantry.")
            }
        }
    }

    private func _gm0111(_ item: _GmBl0017Xy) -> some View {
        ScrollView {
            VStack(spacing: 20) {
                _GmBl0046Xy(_gm0155: item._gm0055).padding(.top, 8)

                _gm0112("Location") {
                    let cols = [GridItem(.adaptive(minimum: 90), spacing: 10)]
                    LazyVGrid(columns: cols, spacing: 10) {
                        ForEach(_GmBl0016Xy.allCases) { s in
                            Button { _gm0189._gm0174(item) { $0._gm0056 = s } } label: {
                                VStack(spacing: 6) {
                                    Image(systemName: s._gm0054)
                                    Text(s.rawValue).font(_GmBl0009Xy._gm0018(12))
                                }
                                .foregroundStyle(item._gm0056 == s ? .white : _GmBl0008Xy._gm0007)
                                .frame(maxWidth: .infinity).padding(.vertical, 14)
                                .background(RoundedRectangle(cornerRadius: 16).fill(item._gm0056 == s ? _GmBl0008Xy._gm0004 : _GmBl0008Xy._gm0002))
                            }
                        }
                    }
                }

                _gm0112("Quantity & state") {
                    VStack(spacing: 12) {
                        Stepper(value: Binding(get: { item._gm0057 }, set: { v in _gm0189._gm0174(item) { $0._gm0057 = v } }), in: 0...99) {
                            Text("\(item._gm0057) on the shelf").font(_GmBl0009Xy._gm0017(15)).foregroundStyle(_GmBl0008Xy._gm0007)
                        }
                        Toggle("Opened", isOn: Binding(get: { item._gm0059 }, set: { v in _gm0189._gm0174(item) { $0._gm0059 = v } }))
                            .tint(_GmBl0008Xy._gm0006).font(_GmBl0009Xy._gm0017(15))
                        Toggle("Star this item", isOn: Binding(get: { item._gm0060 }, set: { v in _gm0189._gm0174(item) { $0._gm0060 = v } }))
                            .tint(_GmBl0008Xy._gm0010).font(_GmBl0009Xy._gm0017(15))
                    }
                    .padding(.horizontal, 14).padding(.vertical, 8)
                }

                _gm0112("Best before") {
                    let hasDate = item._gm0058 != nil
                    VStack(spacing: 10) {
                        Toggle("Track a date", isOn: Binding(
                            get: { hasDate },
                            set: { on in _gm0189._gm0174(item) { $0._gm0058 = on ? (Calendar.current.date(byAdding: .day, value: 7, to: Date())) : nil } }
                        )).tint(_GmBl0008Xy._gm0004).font(_GmBl0009Xy._gm0017(15))
                        if let date = item._gm0058 {
                            DatePicker("", selection: Binding(get: { date }, set: { d in _gm0189._gm0174(item) { $0._gm0058 = d } }), displayedComponents: .date)
                                .datePickerStyle(.compact).tint(_GmBl0008Xy._gm0004)
                        }
                    }
                    .padding(.horizontal, 14).padding(.vertical, 8)
                }

                _gm0112("Note") {
                    TextField("", text: Binding(get: { item._gm0061 }, set: { t in _gm0189._gm0174(item) { $0._gm0061 = t } }),
                              prompt: Text("e.g. half used, for Sunday roast").foregroundStyle(_GmBl0008Xy._gm0008), axis: .vertical)
                        .font(_GmBl0009Xy._gm0017(15)).foregroundStyle(_GmBl0008Xy._gm0007)
                        .lineLimit(2...5).padding(14)
                }

                Button(role: .destructive) {
                    _gm0189._gm0173(item); _gm0194()
                } label: {
                    Label("Remove from pantry", systemImage: "trash")
                        .font(_GmBl0009Xy._gm0016(15)).foregroundStyle(_GmBl0008Xy._gm0011)
                        .frame(maxWidth: .infinity).padding(.vertical, 14)
                        .background(Capsule().fill(_GmBl0008Xy._gm0011.opacity(0.1)))
                }
            }
            .padding(22)
        }
    }

    private func _gm0112<C: View>(_ title: String, @ViewBuilder _ c: () -> C) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title).font(_GmBl0009Xy._gm0016(15)).foregroundStyle(_GmBl0008Xy._gm0007)
            c()._gm0024()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
