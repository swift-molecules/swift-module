extension Module {

    public struct Import: Hashable, Sendable {

        public let module: Module.Name

        public let visibility: Visibility

        public init(module: Module.Name, visibility: Visibility = .internal) {
            self.module = module
            self.visibility = visibility
        }
    }
}
