// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Device",
    platforms: [.iOS(.v9), .macOS(.v10_10)],
    products: [
        .library(
            name: "Device",
            targets: ["Device"]
        )
    ],
    targets: [
        .target(
            name: "Device",
            path: "Source"
        )
    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)
