// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CiderKit.Tween",
    platforms: [
        .macOS(.v14), .iOS(.v13), .macCatalyst(.v13), .tvOS(.v13), .visionOS(.v1)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CiderKit.Tween",
            targets: ["CiderKit.Tween"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CiderKit.Tween"
        ),
        .testTarget(
            name: "CiderKit.Tween.Tests",
            dependencies: ["CiderKit.Tween"],
            resources: [
                .copy("EasingFunctionsTestData.txt")
            ]
        )
    ]
)
