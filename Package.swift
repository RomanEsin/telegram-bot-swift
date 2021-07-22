// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "TelegramBotSDK",
    platforms: [.macOS(.v10_15)],
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
            dependencies: ["CCurl", "TelegramBotSDK"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
