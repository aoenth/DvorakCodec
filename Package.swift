// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DvorakCodec",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .executable(name: "dv", targets: ["DvorakCodecCLI"]),
        .library(
            name: "DvorakCodec",
            targets: ["DvorakCodec"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "git@github.com:aoenth/Pasteboard", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "DvorakCodecCLI",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "DvorakCodec",
                "Pasteboard",
            ]),
        .target(
            name: "DvorakCodec",
            dependencies: []),
        .testTarget(
            name: "DvorakCodecTests",
            dependencies: ["DvorakCodec"]),
    ]
)
