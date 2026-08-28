import Testing

@testable import Module

extension Module.Name {
    @Suite struct Tests {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
        @Suite struct Integration {}
    }
}

extension Module.Name.Tests.Unit {
    @Test
    func `direct construction preserves value`() {
        let name = Module.Name("Buffer")
        #expect(name.value == "Buffer")
    }

    @Test
    func `product construction converts spaces to underscores`() {
        let name = Module.Name(product: "Buffer")
        #expect(name.value == "Buffer")
    }

    @Test
    func `product construction with no spaces`() {
        let name = Module.Name(product: "Foundation")
        #expect(name.value == "Foundation")
    }

    @Test
    func `equality based on value`() {
        let a = Module.Name("Foo")
        let b = Module.Name(product: "Foo")
        #expect(a == b)
    }
}

extension Module.Name.Tests.`Edge Case` {
    @Test
    func `product with multiple spaces`() {
        let name = Module.Name(product: "Graph Reachable")
        #expect(name.value == "Graph_Reachable")
    }
}
