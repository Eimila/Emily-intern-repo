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
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-collections.git",
            from: "1.1.0"
        ),
    ],
    targets: [
        .executableTarget(
            name: "HelloApp",
            dependencies: [
                .product(name: "Collections", package: "swift-collections"),
            ]
        ),
        .testTarget(
            name: "HelloAppTests",
            dependencies: ["HelloApp"]
        ),
    ]
)
