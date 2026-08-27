// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-module",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Module",
            targets: ["Module"]
        ),
        .library(
            name: "Module Standard Library Integration",
            targets: ["Module Standard Library Integration"]
        ),
        .library(
            name: "Module Apple Foundation Integration",
            targets: ["Module Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Module",
            dependencies: []
        ),
        .target(
            name: "Module Standard Library Integration",
            dependencies: ["Module"]
        ),
        .target(
            name: "Module Apple Foundation Integration",
            dependencies: [
                "Module",
                "Module Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Module Tests",
            dependencies: ["Module"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
