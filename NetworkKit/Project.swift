
import ProjectDescription

// MARK: - SETTINGS

let projectConfigurations: [Configuration] = [
    .debug(name: .debug, xcconfig: Path("config/NetworkKitProject.xcconfig")),
    .release(name: .release, xcconfig: Path("config/NetworkKitProject.xcconfig"))
]

let projectSettings: Settings = .settings(configurations: projectConfigurations,
                                          defaultSettings: .none)


let targetConfigurations: [Configuration] = [
    .debug(name: .debug, xcconfig: Path("config/NetworkKitTarget.xcconfig")),
    .release(name: .release, xcconfig: Path("config/NetworkKitTarget.xcconfig"))
]

let targetSettings: Settings = .settings(configurations: targetConfigurations,
                                         defaultSettings: .none)

// MARK: - TARGETS

let networkTarget = Target(name: "NetworkKit",
                           platform: .iOS,
                           product: .framework,
                           bundleId: "co.network.joaoribeiro",
                           infoPlist: "Info.plist",
                           sources: ["Source/**"],
                           settings: targetSettings)

// MARK: - PROJECTS

let networkProject = Project(name: "NetworkKit",
                             organizationName: "Ray Wenderlich",
                             settings: projectSettings,
                             targets: [networkTarget])
