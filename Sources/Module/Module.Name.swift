extension Module {

    public struct Name: Hashable, Sendable {

        public let value: String

        public init(_ value: String) {
            self.value = value
        }

        public init(product name: String) {
            self.value = name.replacing(" ", with: "_")
        }
    }
}
