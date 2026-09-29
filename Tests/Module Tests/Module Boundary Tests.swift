import Testing

@testable import Module

@Suite
struct `Module boundaries` {
    @Test
    func `an empty product name gives an empty module name`() {
        #expect(Module.Name(product: "").value == "")
    }

    @Test
    func `every space becomes an underscore, including repeated and outer ones`() {
        #expect(Module.Name(product: "A  B").value == "A__B")
        #expect(Module.Name(product: " A ").value == "_A_")
    }

    @Test
    func `direct construction keeps spaces`() {
        #expect(Module.Name("Graph Reachable").value == "Graph Reachable")
        #expect(Module.Name("Graph Reachable") != Module.Name(product: "Graph Reachable"))
    }

    @Test
    func `an import defaults to internal visibility`() {
        #expect(Module.Import(module: Module.Name("Buffer")).visibility == .internal)
    }

    @Test
    func `imports of one module differ by visibility`() {
        let name = Module.Name("Buffer")
        let imports: Set<Module.Import> = [
            .init(module: name, visibility: .internal),
            .init(module: name, visibility: .public),
            .init(module: name, visibility: .exported),
            .init(module: name),
        ]
        #expect(imports.count == 3)
    }
}
