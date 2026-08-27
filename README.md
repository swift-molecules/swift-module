# Module

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Value types for Swift module identities and import statements — a `Module` namespace of canonical module names and parsed imports with their visibility, with zero platform dependencies.

---

## Quick Start

`Module` is a small vocabulary for describing Swift modules and the imports that reference them: a module's canonical name and an import statement carrying the visibility it was written with. It holds the *shapes* only — no source parsing, no file access — so the same values travel unchanged from a tool that reads them to every layer that reasons about them.

```swift
import Module

// A module's identity is its canonical underscore form — the spelling used in `import`.
let name = Module.Name(product: "Buffer Primitives")
print(name.value)   // "Buffer"

// Model an import statement together with the visibility it was written with.
let exposed = Module.Import(module: name, visibility: .public)
print(exposed.module.value)   // "Buffer"
print(exposed.visibility)     // .public
```

`Module.Import.Visibility` reports the modifier honestly: `.internal` (a module-internal import, the default), `.public` (re-exposes the imported module's API to downstream clients), and `.exported` (an `@_exported` import that transparently re-exports the module). `Module.Name(product:)` maps a SwiftPM product name to its module spelling by removing a terminal `" Primitives"` packaging suffix and converting the remaining spaces to underscores, so `"Graph Reachable Primitives"` becomes `"Graph_Reachable"`.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-atoms/swift-module.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Module", package: "swift-module"),
    ]
)
```

Requires Swift 6.4 and macOS 27 / iOS 27 / tvOS 27 / watchOS 27 / visionOS 27 (or the matching Linux / Windows toolchain).

---

## Architecture

Three library products, with no external package dependencies.

| Product | Target | Purpose |
|---------|--------|---------|
| `Module` | `Sources/Module/` | The `Module` namespace: `Module.Name` (the canonical underscore module identity), `Module.Import` (an import statement value), and `Module.Import.Visibility` (`internal` / `public` / `exported`). |
| `Module Standard Library Integration` | `Sources/Module Standard Library Integration/` | The standard-library integration surface for the Module atom. |
| `Module Apple Foundation Integration` | `Sources/Module Apple Foundation Integration/` | The Foundation-facing aggregation product. |

Foundation is imported only by the Apple Foundation Integration target.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 27 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS 27 / tvOS 27 / watchOS 27 / visionOS 27 | Supported |
| Swift Embedded | Native core supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
