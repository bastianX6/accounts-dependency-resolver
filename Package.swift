// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "DependencyResolver",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .macOS(.v10_15),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "DependencyResolver",
            targets: ["DependencyResolver"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "DataManagement",
                 url: "https://github.com/bastianX6/accounts-data-management.git",
                 from: "1.0.1"),
        .package(name: "AccountsCoreDataManagement",
                 url: "https://github.com/bastianX6/accounts-coredata-management.git",
                 from: "1.0.1"),
        .package(name: "AccountsUI",
                 url: "https://github.com/bastianX6/accounts-ui.git",
                 from: "1.0.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DependencyResolver",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "AccountsCoreDataManagement",
            ]),
        .testTarget(
            name: "DependencyResolverTests",
            dependencies: ["DependencyResolver"]),
    ]
)
