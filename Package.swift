// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "cleanboot_iOS",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "cleanboot_iOS",
            targets: ["cleanboot_iOS"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "cleanboot_iOS"),
        .testTarget(
            name: "cleanboot_iOSTests",
            dependencies: ["cleanboot_iOS"]),
    ]
)
