// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "APIListApp",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .executable(
            name: "APIListApp",
            targets: ["APIListApp"]
        ),
    ],
    targets: [
        .executableTarget(
            name: "APIListApp"
        ),
    ]
)
