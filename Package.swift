// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "rc-kit",
    platforms: [
       .macOS(.v12)
    ],
    products: [
        .library(name: "rc-kit", targets: ["rc-kit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0")
    ],
    targets: [
        .target( name: "rc-kit", dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]),
        .testTarget(name: "RCKitTests", dependencies: ["rc-kit"]),
    ]
)
