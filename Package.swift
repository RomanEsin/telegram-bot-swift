// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "TelegramBotSDK",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "TelegramBotSDK",
            targets: ["TelegramBotSDK"]),
    ],
    targets: [
        .target(
            name: "TelegramBotSDK",
            dependencies: []),
        .testTarget(
            name: "TelegramBotSDKTests",
            dependencies: ["TelegramBotSDK"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
