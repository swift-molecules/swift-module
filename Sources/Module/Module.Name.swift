extension Module {

    public struct Name: Hashable, Sendable {

        public let value: String

        public init(_ value: String) {
            self.value = value
        }

        public init(product name: String) {
            var value = ""
            for character in name {
                value.append(character == " " ? "_" : character)
            }
            self.value = value
        }
    }
}
