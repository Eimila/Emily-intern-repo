// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "JSONPlaceholderProject",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "JSONPlaceholderProject",
            targets: ["JSONPlaceholderProject"]
        ),
        .executable(
            name: "JSONPlaceholderProjectApp",
            targets: ["JSONPlaceholderProjectApp"]
        ),
    ],
    targets: [
        .target(
            name: "JSONPlaceholderProject"
        ),
        .executableTarget(
            name: "JSONPlaceholderProjectApp",
            dependencies: ["JSONPlaceholderProject"]
        ),
        .testTarget(
            name: "JSONPlaceholderProjectTests",
            dependencies: ["JSONPlaceholderProject"]
        ),
    ]
)
