// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Device",
    platforms: [
        .iOS(.v8),
        .macOS(.v10_10),
    ],
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
            exclude: [
                "Device",
                "Device macOS",
                "Example",
                "Example macOS",
            ]
        ),
    ]
)
