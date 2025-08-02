# CiderKit.Tween

A pure Swift tweening library complying with Swift 6 Strict Concurency.

It was primarily designed to work with [CiderKit](https://github.com/chsxf/CiderKit), but it is completely agnostic and can be used within any project.

![](https://img.shields.io/badge/Platform-macOS%2014%2B%20%7C%20iOS%2013%2B%20%7C%20iPadOS%2013%2B%20%7C%20tvOS%2013%2B%20%7C%20visionOS%201%2B-orange)
![](https://img.shields.io/badge/Swift-6-orange)
![](https://github.com/chsxf/CiderCSSKit/actions/workflows/swift.yml/badge.svg)
[![](https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg)](https://gitmoji.dev/)
![](https://analytics.chsxf.dev/GitHubStats.badge/CiderKig.Tween/README.md) 

# Installation with Swift Package Manager

CiderKit.Tween is available through [Swift Package Manager](https://github.com/apple/swift-package-manager).

## As a Package Dependency

To install it, simply add the dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/chsxf/CiderTween.Kit.git", requirement: .branch("main")),
],
targets: [
    .target(name: "YourTarget", dependencies: ["CiderKit.Tween"]),
]
```

## As a Project Dependency in Xcode

- In Xcode, select **File > Add Packages...** and enter `https://github.com/chsxf/CiderTween.Kit.git` in the search field (top-right). 
- Then select **Branch** as the **Dependency Rule** with `main` in the associated text field.
- Then select the project of your choice in the **Add to Project** list.
- Finally, click the **Add Package** button.

# License

Unless stated otherwise, all source code and assets are distributed under the [MIT License](LICENSE).
