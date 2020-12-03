// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Device",
    platforms: [.iOS(.v9), .macOS(.v10_10)],
    products: [
        .library(
            name: "Device",
            targets: ["Device"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Device",
            dependencies: [],
            path: "Source",
            resources: [
                .process("Asset/device.png")
            ]
        )
    ]
)
