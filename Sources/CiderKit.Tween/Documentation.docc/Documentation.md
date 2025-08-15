# ``CiderKit_Tween``

A pure Swift tweening library that complies with Swift 6 Strict Concurrency.

## Overview

CikderKit.Tween is a tweening library written in pure Swift that complies with Swift 6 Strict Concurrency.

It was primarily designed to work with [CiderKit](https://github.com/chsxf/CiderKit), but it is completely agnostic and can be used within any project.

Follow the <doc:Getting-Started> guide to create your first tween.

## Requirements

The package supports the following platforms:

- macOS version 14.0 and later
- MacCatalyst version 13.0 and later
- iOS and iPadOS version 13.0 and later
- tvOS version 13.0 and later
- visionOS 1.0 and later

_CiderKit.Tween does not support watchOS at the moment._

## Features

The package allows you to create tweens to animate values of any `Sendable` type with linear or non-linear interpolation.

Built-in extensions are available for the following types:

- `Int` (+ `SIMD2` to `SIMD64` variants)
- `UInt` (+ `SIMD2` to `SIMD64` variants)
- `Float` (+ `SIMD2` to `SIMD64` variants)
- `Double` (+ `SIMD2` to `SIMD64` variants)
- `CGFloat` 
- `CGPoint`
- `CGRect`
- `CGSize`
- `String` (with optional scrambled text)

## License

Unless stated otherwise, all source code and assets are distributed under the [MIT License](LICENSE).
