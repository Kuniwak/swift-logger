// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-logger",
    platforms: [
        .macOS(.v11),
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v4),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "Logger",
            targets: ["Logger"]
        ),
    ],
    targets: [
        .target(name: "Logger"),
        .testTarget(
            name: "LoggerTests",
            dependencies: ["Logger"]
        )
    ]
)
