// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "DocumentationModule",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17),
        .watchOS(.v10),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "DocumentationModule",
            targets: ["DocumentationModule"]
        ),
        .executable(
            name: "DocumentationModuleDemo",
            targets: ["DocumentationModuleDemo"]
        )
    ],
    targets: [
        .target(
            name: "DocumentationModule",
            path: "Sources/DocumentationModule"
        ),
        .executableTarget(
            name: "DocumentationModuleDemo",
            dependencies: ["DocumentationModule"],
            path: "Sources/DocumentationModuleDemo"
        )
    ]
)
