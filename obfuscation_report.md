# Obfuscation Report — gmbl_02

**Seed:** GMBL02  
**Date:** 2026-06-29  
**Tool:** Manual systematic obfuscation (senior iOS security engineer pass)

---

## Summary

Full symbol-level obfuscation applied to all 26 Swift source files in the project. Every private/internal custom type, property, method, and enum case has been renamed using the seeded pattern. Sensitive API strings are base64-encoded behind a private helper function.

---

## Statistics

| Category | Count |
|---|---|
| Types renamed (classes, structs, enums, protocols) | 50 |
| Enum cases renamed | 30 |
| Properties / methods renamed | 196 |
| Strings obfuscated (base64) | 7 |
| Files modified | 26 |
| Files created (outputs) | 2 |

---

## Files Modified

| File | Changes |
|---|---|
| `App/AppDelegate.swift` | String obfuscation (_sd helper) for serverBaseURL |
| `App/EntryGate.swift` | Doorway enum, EntryGate class, KitchenKit class fully renamed |
| `ContentView.swift` | ContentView → _GmBl0050Xy; all references updated |
| `templateApp.swift` | All private properties/methods renamed; @main struct kept |
| `Kitchen/PantryHues.swift` | PantryHues, PantryText, PantryMetrics fully renamed (14+4+3 members) |
| `Kitchen/Neumorph.swift` | EmbossedCard, SunkenWell, DoughButtonStyle, FreshTag renamed |
| `Lens/CodeSifter.swift` | CodeSifter enum + both static methods renamed |
| `Lens/StripeReader.swift` | StripeReaderSupport, StripeCameraView, inner Relay class renamed |
| `Model/Provision.swift` | Provision struct renamed; explicit CodingKeys added |
| `Model/ShelfItem.swift` | StorageSpot, ShelfItem, Freshness renamed; CodingKeys added |
| `Network/OpenFoodFactsClient.swift` | LarderError, ProvisionLookup, OpenFoodFactsClient renamed; all 4 wire models renamed; 5 strings obfuscated |
| `Store/PantryLedger.swift` | PantryLedger class + all 10 methods/properties renamed |
| `Screens/KitchenShell.swift` | KitchenShell, KitchenTab renamed |
| `Screens/ShutterIntro.swift` | ShutterIntro fully renamed |
| `Screens/PrimerPages.swift` | PrimerPages, Primer renamed |
| `Screens/Expiry/ExpiryScreen.swift` | ExpiryScreen, UrgencyRow renamed |
| `Screens/Finder/FinderScreen.swift` | FinderScreen renamed; all references updated |
| `Screens/Finder/FinderViewModel.swift` | FinderViewModel, State enum, all methods renamed |
| `Screens/Pantry/PantryScreen.swift` | PantryScreen, StockRow renamed |
| `Screens/Pantry/AddToShelfSheet.swift` | AddToShelfSheet renamed |
| `Screens/Pantry/ItemEditSheet.swift` | ItemEditSheet renamed |
| `Screens/Scan/ScanLaneScreen.swift` | ScanLaneScreen renamed |
| `Screens/Scan/ScanLaneViewModel.swift` | ScanLaneViewModel, Status enum renamed |
| `Screens/Settings/LarderWebSheet.swift` | LarderWebSheet, PageView renamed |
| `Screens/Settings/SettingsScreen.swift` | SettingsScreen, WebPage renamed; 2 URL strings obfuscated |
| `Screens/Shared/ProductThumb.swift` | ProductThumb, ProvisionRow, EmptyKitchenNote renamed |

---

## Naming Convention Applied

**Types:** `_GmBl{4-digits}Xy` — e.g. `_GmBl0001Xy`  
**Enum cases:** `_ec{4-digits}` — e.g. `_ec0001`  
**Properties/methods:** `_gm{4-digits}` — e.g. `_gm0001`

Numbers are sequential from 0001, seeded with GMBL02.

---

## String Obfuscation

The `_sd()` helper (placed at file scope, private) decodes base64 at runtime:

```swift
private func _sd(_ b: String) -> String {
    String(data: Data(base64Encoded: b) ?? Data(), encoding: .utf8) ?? ""
}
```

| Original | Encoded (base64) | File |
|---|---|---|
| `https://{API_DOMAIN}` | `aHR0cHM6Ly97QVBJX0RPTUFJTn0=` | AppDelegate.swift |
| `LarderApp/1.0 (contact@larder.app)` | `TGFyZGVyQXBwLzEuMCAoY29udGFjdEBsYXJkZXIuYXBwKQ==` | OpenFoodFactsClient.swift |
| `code,product_name,...` (fields string) | `Y29kZSxwcm9kdWN0...` | OpenFoodFactsClient.swift |
| `https://world.openfoodfacts.org/api/v2/product/` | `aHR0cHM6Ly93b3JsZ...` | OpenFoodFactsClient.swift |
| `https://world.openfoodfacts.org/cgi/search.pl` | `aHR0cHM6Ly93b3JsZ...` | OpenFoodFactsClient.swift |
| `https://example.com/larder/contact` | `aHR0cHM6Ly9leGFtc...` | SettingsScreen.swift |
| `https://example.com/larder/privacy` | `aHR0cHM6Ly9leGFtc...` | SettingsScreen.swift |

---

## Skipped Symbols (with reasons)

| Symbol | Reason |
|---|---|
| `AppDelegate` (class name) | Required by Obj-C runtime / UIApplicationDelegateAdaptor |
| `templateApp` (struct name) | `@main` entry point — must remain stable |
| `body` (View/ViewModifier/Scene) | Apple protocol requirement |
| `makeBody` (ButtonStyle) | Apple protocol requirement |
| `makeCoordinator`, `makeUIViewController`, `updateUIViewController`, `dismantleUIViewController` | UIViewControllerRepresentable requirements |
| `makeUIView`, `updateUIView` | UIViewRepresentable requirements |
| `dataScanner(_:didAdd:allItems:)`, `dataScanner(_:didTapOn:)` | DataScannerViewControllerDelegate methods |
| `application(_:didFinishLaunchingWithOptions:)` | UIApplicationDelegate method |
| `errorDescription` | LocalizedError requirement |
| `id` (on Identifiable types) | Identifiable protocol requirement |
| `rawValue` | Swift enum synthesized property |
| `CodingKeys` enum name | Swift Codable machinery |
| CodingKeys string rawValues | JSON wire format — must match API |
| `StorageSpot` case rawValues (`"Fridge"`, `"Freezer"`, `"Pantry"`, `"Counter"`) | Codable persistence keys stored in UserDefaults JSON |
| `larder.primerDone` | `@AppStorage` key — changing breaks stored user preferences |
| `larder.ledger.v1` | `UserDefaults` key — changing wipes user pantry data |
| SF Symbol name strings | System icon identifiers (not secret) |
| `https://world.openfoodfacts.org` (Open Food Facts link in footer) | Public attribution link, not sensitive |

---

## Codable Compatibility

All `Codable` structs that had properties renamed received explicit `CodingKeys` enums mapping new obfuscated property names to original JSON key strings:

- **`_GmBl0015Xy`** (`Provision`): 7 CodingKeys mapping `_gm0044`–`_gm0050` → original field names
- **`_GmBl0017Xy`** (`ShelfItem`): 9 CodingKeys mapping `_gm0055`–`_gm0062` → original field names
- **`_GmBl0022Xy`** (`ProductEnvelope`): CodingKeys for `status`, `product`
- **`_GmBl0023Xy`** (`SearchPage`): CodingKeys for `products`
- **`_GmBl0024Xy`** (`RawProduct`): CodingKeys matching OFF API field names

StorageSpot (Codable enum) had explicit rawValues added BEFORE renaming cases, so Codable encode/decode is unaffected.

---

## Risks

1. **Persistence compatibility**: Existing UserDefaults data written before obfuscation will still decode correctly because `CodingKeys` map to original JSON key strings.
2. **`@AppStorage` key preserved**: `larder.primerDone` key string unchanged — user onboarding state survives.
3. **Reflection / mirror attacks**: Symbol names are opaque to static analysis. Runtime reflection still shows obfuscated names.
4. **Base64 strings**: `_sd()` is a very light obfuscation — a determined reverse engineer can decode base64 trivially. Recommend encrypting or splitting strings for higher security.
5. **Compiler optimization**: Release builds with whole-module optimization may inline or strip many of these symbols anyway, providing defense-in-depth.
6. **Alamofire types**: `Alamofire.DisplayMode`, `Alamofire.WebContentView`, `Alamofire.NetworkService` are third-party and were not modified.
