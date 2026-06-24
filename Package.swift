// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "LevelPlay-Swift-Package",
  platforms: [.iOS(.v12)],
  products: [
    .library(name: "UnityMediationSDK", targets: ["LPSPM"]),
  ],
  dependencies: [
    .package(url: "https://github.com/ironsource-mobile/Unity-Ad-Quality-Swift-Package", "9.7.0"..<"9.8.0")
  ],
  targets: [
    .target(
      name: "LPSPM",
      dependencies: [
        .target(name: "IronSourceSDK"),
        .product(name: "AdQuality", package: "Unity-Ad-Quality-Swift-Package")
      ],
      linkerSettings: [
        .linkedFramework("AdSupport"),
        .linkedFramework("AudioToolbox"),
        .linkedFramework("AVFoundation"),
        .linkedFramework("CFNetwork"),
        .linkedFramework("CoreGraphics"),
        .linkedFramework("CoreMedia"),
        .linkedFramework("CoreTelephony"),
        .linkedFramework("CoreVideo"),
        .linkedFramework("Foundation"),
        .linkedFramework("MobileCoreServices"),
        .linkedFramework("QuartzCore"),
        .linkedFramework("Security"),
        .linkedFramework("StoreKit"),
        .linkedFramework("SystemConfiguration"),

        .linkedLibrary("z"),

        // NOTE: Swift Package Manager currently does not allow dependencies with unsafeFlags, unless a specific branch/commit is used.
        // For now, these flags should be added manually to the project for integration.
        // .unsafeFlags(["-ObjC"])
      ]),
    .binaryTarget(
      name: "IronSourceSDK",
      url: "https://raw.githubusercontent.com/ironsource-mobile/iOS-sdk/master/9.4.2/IronSource9.4.2.zip",
      checksum: "9ccee1d9bb1ccffd20336e27d31e81830e6bfeb8cc804adec57acf36b71328e8"
    ),
  ]
)
