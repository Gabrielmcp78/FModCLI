// swift-tools-version:6.2
import PackageDescription

let package = Package(
    name: "FModCLI",
    platforms: [
        .macOS(.v26)
    ],
    products: [
        .executable(name: "FModCLI", targets: ["FModCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0")
    ],
    targets: [
        .executableTarget(
            name: "FModCLI",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "ArgumentParserToolInfo", package: "swift-argument-parser")
            ]
        )
    ]
)
