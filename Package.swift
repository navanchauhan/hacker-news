// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "HackerNewsAdwaita",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v14),
    ],
    products: [
        .executable(name: "HackerNewsAdwaita", targets: ["HackerNewsAdwaita"]),
    ],
    dependencies: [
        .package(path: "../swift-omnikit"),
    ],
    targets: [
        .executableTarget(
            name: "HackerNewsAdwaita",
            dependencies: [
                .product(name: "OmniUIAdwaita", package: "swift-omnikit"),
                .product(name: "Sparkle", package: "swift-omnikit"),
            ],
            path: "Hacker News",
            resources: [
                .process("Resources"),
            ],
            swiftSettings: [
                .swiftLanguageMode(.v5),
                .unsafeFlags(["-module-alias", "SwiftUI=OmniUIAdwaita"]),
                .unsafeFlags(["-Xfrontend", "-default-isolation", "-Xfrontend", "MainActor"]),
                .unsafeFlags(["-Xfrontend", "-solver-expression-time-threshold=20000"]),
            ]
        ),
    ]
)
