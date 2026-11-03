# swift-module

Use this package when you need to name a Swift module or describe an import of one, for example when generating source files or a manifest that imports another module. Start from `Module.Name` for the module itself and `Module.Import` for an import of it. For locations and ranges within source files, use the sibling `swift-source` (its `Source` module is re-exported here).

## Laws

- `Module.Name(product:)` turns a product name into a module name by replacing every space with an underscore, including leading, trailing and repeated spaces; every other character, Unicode included, is kept, and an empty product name gives an empty module name.
- `Module.Name(_:)` keeps its string exactly as given, spaces included, with no validation.
- Two `Module.Name` values are equal exactly when their strings are equal, so the same product name containing spaces gives different names through `Module.Name(_:)` and `Module.Name(product:)`.
- A `Module.Import` is internal unless a visibility is given, and its identity includes the visibility: imports of the same module at `.internal`, `.public` and `.exported` are three distinct values.
