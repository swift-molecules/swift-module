extension Module {

    public struct Name: Hashable, Sendable {

        public let value: String

        public init(_ value: String) {
            self.value = value
        }

        public init(product name: String) {
            let suffix = " Primitives"
            let product = name.hasSuffix(suffix)
                ? String(name.dropLast(suffix.count))
                : name
            self.value = product.replacing(" ", with: "_")
        }
    }
}
