// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftTestHarness",
    dependencies: [
        .package(name: "IanaTimeZoneHaiku", path: "../build/SPMPackage/macosArm64/Debug")
    ],
    targets: [
        .testTarget(
            name: "SwiftTestHarnessTests",
            dependencies: [
                .product(name: "IanaTimeZoneHaikuLibrary", package: "IanaTimeZoneHaiku")
            ],
            linkerSettings: [
                .unsafeFlags([
                    "-L", "../build/swift-test",
                    "-lIanaTimeZoneHaiku",
                ]),
            ]
        ),
    ]
)
