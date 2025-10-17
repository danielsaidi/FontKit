// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "FontKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8),
        .macOS(.v12),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "FontKit",
            targets: ["FontKit"]
        )
    ],
    targets: [
        .target(
            name: "FontKit",
            resources: [.process("Fonts")]
        ),
        .testTarget(
            name: "FontKitTests",
            dependencies: ["FontKit"]
        )
    ]
)
