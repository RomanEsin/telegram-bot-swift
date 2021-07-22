// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "TelegramBotSDK",
    platforms: [.macOS(.v11)],
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
    ]
)
