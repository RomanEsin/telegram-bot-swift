// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "TelegramBotSDK",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "CCurl",
            targets: ["CCurl"]),
        .library(
            name: "TelegramBotSDK",
            targets: ["TelegramBotSDK"]),
    ],
    targets: [
        .target(
            name: "CCurl",
            dependencies: []),
        .target(
            name: "TelegramBotSDK",
            dependencies: ["CCurl"]),
        .testTarget(
            name: "TelegramBotSDKTests",
            dependencies: ["TelegramBotSDK"]
        )
    ]
)
