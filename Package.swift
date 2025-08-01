// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "ParseObjC",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_15),
        .tvOS(.v12),
        .watchOS(.v2)
    ],
    products: [
        .library(name: "ParseObjC", targets: ["ParseCore"]),
        .library(name: "ParseFacebookUtils", targets: ["ParseFacebookUtils"]),
        .library(name: "ParseFacebookUtilsiOS", targets: ["ParseFacebookUtilsiOS"]),
        .library(name: "ParseFacebookUtilsTvOS", targets: ["ParseFacebookUtilsTvOS"]),
        .library(name: "ParseTwitterUtils", targets: ["ParseTwitterUtils"]),
        .library(name: "ParseUI", targets: ["ParseUI"]),
        .library(name: "ParseLiveQuery", targets: ["ParseLiveQuery"])
    ],
    dependencies: [
        .package(url: "https://github.com/parse-community/Bolts-ObjC.git", from: "1.10.0"),
        .package(url: "https://github.com/BoltsFramework/Bolts-Swift.git", from: "1.5.0"),
        .package(url: "https://github.com/daltoniam/Starscream.git", from: "4.0.6"),
        .package(url: "https://github.com/facebook/facebook-ios-sdk.git", from: "15.1.0"),
//        .package(name: "OCMock", url: "https://github.com/erikdoe/ocmock.git", .revision("67bb9602f0a7541f24dc2d6d0d7389ca3e4c2c89"))
    ],
    targets: [
        .target(
            name: "ParseCore",
            dependencies: [.product(name: "Bolts", package: "Bolts-ObjC")],
            path: "Parse/Parse",
            exclude: ["Resources/Parse-tvOS.Info.plist", "Resources/Parse-iOS.Info.plist", "Resources/Parse-OSX.Info.plist", "Resources/Parse-watchOS.Info.plist"],
            resources: [.process("Resources")],
            publicHeadersPath: "Source",
            cSettings: [
                            .headerSearchPath("Internal"),
                            .headerSearchPath("Internal/ACL"),
                            .headerSearchPath("Internal/ACL/DefaultACLController"),
                            .headerSearchPath("Internal/ACL/State"),
                            .headerSearchPath("Internal/Analytics"),
                            .headerSearchPath("Internal/Analytics/Controller"),
                            .headerSearchPath("Internal/Analytics/Utilities"),
                            .headerSearchPath("Internal/CloudCode"),
                            .headerSearchPath("Internal/Commands"),
                            .headerSearchPath("Internal/Commands/CommandRunner"),
                            .headerSearchPath("Internal/Commands/CommandRunner/URLRequestConstructor"),
                            .headerSearchPath("Internal/Commands/CommandRunner/URLSession"),
                            .headerSearchPath("Internal/Commands/CommandRunner/URLSession/Session"),
                            .headerSearchPath("Internal/Commands/CommandRunner/URLSession/Session/TaskDelegate"),
                            .headerSearchPath("Internal/Config"),
                            .headerSearchPath("Internal/Config/Controller"),
                            .headerSearchPath("Internal/FieldOperation"),
                            .headerSearchPath("Internal/File"),
                            .headerSearchPath("Internal/File/Controller"),
                            .headerSearchPath("Internal/File/FileDataStream"),
                            .headerSearchPath("Internal/File/State"),
                            .headerSearchPath("Internal/HTTPRequest"),
                            .headerSearchPath("Internal/Installation"),
                            .headerSearchPath("Internal/Installation/Constants"),
                            .headerSearchPath("Internal/Installation/Controller"),
                            .headerSearchPath("Internal/Installation/CurrentInstallationController"),
                            .headerSearchPath("Internal/Installation/InstallationIdentifierStore"),
                            .headerSearchPath("Internal/KeyValueCache"),
                            .headerSearchPath("Internal/LocalDataStore"),
                            .headerSearchPath("Internal/LocalDataStore/OfflineQueryLogic"),
                            .headerSearchPath("Internal/LocalDataStore/OfflineStore"),
                            .headerSearchPath("Internal/LocalDataStore/Pin"),
                            .headerSearchPath("Internal/LocalDataStore/SQLite"),
                            .headerSearchPath("Internal/MultiProcessLock"),
                            .headerSearchPath("Internal/Object"),
                            .headerSearchPath("Internal/Object/BatchController"),
                            .headerSearchPath("Internal/Object/Coder"),
                            .headerSearchPath("Internal/Object/Coder/File"),
                            .headerSearchPath("Internal/Object/Constants"),
                            .headerSearchPath("Internal/Object/Controller"),
                            .headerSearchPath("Internal/Object/Controller/OfflineController"),
                            .headerSearchPath("Internal/Object/CurrentController"),
                            .headerSearchPath("Internal/Object/EstimatedData"),
                            .headerSearchPath("Internal/Object/FilePersistence"),
                            .headerSearchPath("Internal/Object/LocalIdStore"),
                            .headerSearchPath("Internal/Object/OperationSet"),
                            .headerSearchPath("Internal/Object/PinningStore"),
                            .headerSearchPath("Internal/Object/State"),
                            .headerSearchPath("Internal/Object/Subclassing"),
                            .headerSearchPath("Internal/Object/Utilities"),
                            .headerSearchPath("Internal/Persistence"),
                            .headerSearchPath("Internal/Persistence/Group"),
                            .headerSearchPath("Internal/Product"),
                            .headerSearchPath("Internal/Product/ProductsRequestHandler"),
                            .headerSearchPath("Internal/PropertyInfo"),
                            .headerSearchPath("Internal/Purchase"),
                            .headerSearchPath("Internal/Purchase/Controller"),
                            .headerSearchPath("Internal/Purchase/PaymentTransactionObserver"),
                            .headerSearchPath("Internal/Push"),
                            .headerSearchPath("Internal/Push/ChannelsController"),
                            .headerSearchPath("Internal/Push/Controller"),
                            .headerSearchPath("Internal/Push/Manager"),
                            .headerSearchPath("Internal/Push/State"),
                            .headerSearchPath("Internal/Push/Utilites"),
                            .headerSearchPath("Internal/Query"),
                            .headerSearchPath("Internal/Query/Controller"),
                            .headerSearchPath("Internal/Query/State"),
                            .headerSearchPath("Internal/Query/Utilities"),
                            .headerSearchPath("Internal/Relation"),
                            .headerSearchPath("Internal/Relation/State"),
                            .headerSearchPath("Internal/Session"),
                            .headerSearchPath("Internal/Session/Controller"),
                            .headerSearchPath("Internal/Session/Utilities"),
                            .headerSearchPath("Internal/ThreadSafety"),
                            .headerSearchPath("Internal/User"),
                            .headerSearchPath("Internal/User/AuthenticationProviders"),
                            .headerSearchPath("Internal/User/AuthenticationProviders/Controller"),
                            .headerSearchPath("Internal/User/AuthenticationProviders/Providers"),
                            .headerSearchPath("Internal/User/AuthenticationProviders/Providers/Anonymous"),
                            .headerSearchPath("Internal/User/Coder"),
                            .headerSearchPath("Internal/User/Coder/File"),
                            .headerSearchPath("Internal/User/Constants"),
                            .headerSearchPath("Internal/User/Controller"),
                            .headerSearchPath("Internal/User/CurrentUserController"),
                            .headerSearchPath("Internal/User/State"),
                        ]
        ),
        .target(
            name: "ParseFacebookUtils",
            dependencies: [
                "ParseCore",
                .product(name: "Bolts", package: "Bolts-ObjC"),
                .product(name: "FacebookCore", package: "facebook-ios-sdk", condition: .when(platforms: [.iOS, .tvOS])),
                .product(name: "FacebookLogin", package: "facebook-ios-sdk", condition: .when(platforms: [.iOS, .tvOS]))],
            path: "ParseFacebookUtils/ParseFacebookUtils",
            exclude: ["Resources/Info-tvOS.plist", "Resources/Info-iOS.plist"],
            resources: [.process("Resources")],
            publicHeadersPath: "Source"
        ),
        .target(
            name: "ParseFacebookUtilsiOS",
            dependencies: [
                "ParseFacebookUtils"
            ],
            path: "ParseFacebookUtilsiOS/ParseFacebookUtilsiOS",
            exclude: ["Resources/Info-iOS.plist"],
            resources: [.process("Resources")],
            publicHeadersPath: "Source",
            cSettings: [.headerSearchPath("Internal/**")]
        ),
        .target(
            name: "ParseFacebookUtilsTvOS",
            dependencies: [
                "ParseFacebookUtils",
                .product(name: "FacebookTV", package: "facebook-ios-sdk", condition: .when(platforms: [.tvOS]))
            ],
            path: "ParseFacebookUtilsTvOS/ParseFacebookUtilsTvOS",
            exclude: ["Resources/Info-tvOS.plist"],
            resources: [.process("Resources")],
            publicHeadersPath: "Source",
            cSettings: [.headerSearchPath("Internal/**")]
        ),
        .target(
            name: "ParseTwitterUtils",
            dependencies: [
                "ParseCore"
            ],
            path: "ParseTwitterUtils/ParseTwitterUtils",
            exclude: ["Resources/Info-iOS.plist"],
            resources: [.process("Resources")],
            publicHeadersPath: "Source",
            cSettings: [.headerSearchPath("Internal/**")]
        ),
        .target(
            name: "ParseUI",
            dependencies: [
                "ParseFacebookUtilsiOS",
                "ParseTwitterUtils"
            ],
            path: "ParseUI/ParseUI",
            exclude: ["Resources/Info-iOS.plist"],
            resources: [.process("Resources")],
            publicHeadersPath: "Source",
            cSettings: [.headerSearchPath("Internal/**")]
        ),
        .target(
            name: "ParseLiveQuery",
            dependencies: [
                .product(name: "BoltsSwift", package: "Bolts-Swift"),
                "Starscream",
                "ParseCore"
            ],
            path: "ParseLiveQuery/ParseLiveQuery",
            exclude: ["Resources/Info.plist"],
            resources: [.process("Resources")]
        )
    ]
)
