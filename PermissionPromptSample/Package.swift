// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PermissionPromptSample",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .executable(
            name: "PermissionPromptSample",
            targets: ["PermissionPromptSample"]
        ),
    ],
    targets: [
        .executableTarget(
            name: "PermissionPromptSample"
        ),
    ]
)
