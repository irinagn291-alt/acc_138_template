import SwiftUI
import Vision
import VisionKit

@MainActor
enum _GmBl0012Xy {
    static var _gm0039: Bool {
        DataScannerViewController.isSupported && DataScannerViewController.isAvailable
    }
}

struct _GmBl0013Xy: UIViewControllerRepresentable {
    let _gm0040: (String) -> Void

    func makeCoordinator() -> _GmBl0014Xy { _GmBl0014Xy(_gm0042: _gm0040) }

    func makeUIViewController(context: Context) -> DataScannerViewController {
        let kinds: [VNBarcodeSymbology] = [.ean13, .ean8, .upce, .code128]
        let vc = DataScannerViewController(
            recognizedDataTypes: [.barcode(symbologies: kinds)],
            qualityLevel: .balanced,
            recognizesMultipleItems: false,
            isHighlightingEnabled: true
        )
        vc.delegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ vc: DataScannerViewController, context: Context) {
        guard !context.coordinator._gm0041 else { return }
        context.coordinator._gm0041 = true
        DispatchQueue.main.async { try? vc.startScanning() }
    }

    static func dismantleUIViewController(_ vc: DataScannerViewController, coordinator: _GmBl0014Xy) {
        vc.stopScanning()
        coordinator._gm0041 = false
    }

    final class _GmBl0014Xy: NSObject, DataScannerViewControllerDelegate {
        var _gm0041 = false
        private let _gm0042: (String) -> Void
        init(_gm0042: @escaping (String) -> Void) { self._gm0042 = _gm0042 }

        func dataScanner(_ s: DataScannerViewController, didAdd added: [RecognizedItem], allItems: [RecognizedItem]) {
            for item in added { _gm0043(item) }
        }
        func dataScanner(_ s: DataScannerViewController, didTapOn item: RecognizedItem) { _gm0043(item) }

        private func _gm0043(_ item: RecognizedItem) {
            if case .barcode(let b) = item, let v = b.payloadStringValue { _gm0042(v) }
        }
    }
}
