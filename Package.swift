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
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-source.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "Module",
            dependencies: [
                .product(name: "Source", package: "swift-source")
            ]
        ),
        .testTarget(
            name: "Module Tests",
            dependencies: [
                .target(name: "Module"),
            ]
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
