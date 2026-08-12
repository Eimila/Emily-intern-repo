// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "HelloApp",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .executable(
            name: "HelloApp",
            targets: ["HelloApp"]
        ),
    ],
    targets: [
        .executableTarget(
            name: "HelloApp"
        ),
        .testTarget(
            name: "HelloAppTests",
            dependencies: ["HelloApp"]
        ),
    ]
)
