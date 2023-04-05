// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyPackage",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "frametest",
            targets: ["FirebaseAnalyticsTarget"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/socketio/socket.io-client-swift", .upToNextMinor(from: "15.0.0")),
   
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
          name: "FirebaseAnalyticsTarget",
          dependencies: [.target(name: "frametestWrapper")],
          path: "FirebaseAnalyticsTarget"
        ),
        .target(
          name: "frametestWrapper",
          dependencies:[
            .product(name: "SocketIO", package: "socket.io-client-swift"),
              .target(name: "frametest"),
          ],
          path: "frametestWrapper"
        ),
        .binaryTarget(
          name: "frametest",
          path: "./Sources/frametest.xcframework"
        )
    ]
)

