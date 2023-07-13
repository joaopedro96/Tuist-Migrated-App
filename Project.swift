
import ProjectDescription

// MARK: - SETTINGS

let targetConfigurations: [Configuration] = [
    .debug(name: .debug, xcconfig: Path("config/MovieInfoTarget.xcconfig")),
    .release(name: .release, xcconfig: Path("config/MovieInfoTarget.xcconfig"))
]

let targetSettings: Settings = .settings(configurations: targetConfigurations,
                                         defaultSettings: .none)

let projectConfigurations: [Configuration] = [
    .debug(name: .debug, xcconfig: Path("config/MovieInfoProject.xcconfig")),
    .release(name: .release, xcconfig: Path("config/MovieInfoProject.xcconfig"))
]

let projectSettings: Settings = .settings(configurations: projectConfigurations,
                                          defaultSettings: .none)

// MARK: - DEPENDENCIES

let networkProject = TargetDependency.project(target: "NetworkKit",
                                              path: .relativeToManifest("NetworkKit"))

// MARK: - TARGETS

let movieInfoTarget = Target(name: "MovieInfo",
                             platform: .iOS,
                             product: .app,
                             bundleId: "co.joaoribeiro",
                             infoPlist: "MovieInfo/Info.plist",
                             sources: ["MovieInfo/Source/**"],
                             resources: ["MovieInfo/Resources/**"],
                             dependencies: [networkProject],
                             settings: targetSettings)

let testsTarget = Target(name: "MovieInfoTests",
                         platform: .iOS,
                         product: .unitTests,
                         bundleId: "co.tests.joaoribeiro",
                         infoPlist: "MovieInfoTests/Resources/Info.plist",
                         sources: ["MovieInfoTests/Source/**"],
                         dependencies: [.target(name: "MovieInfo")])

// MARK: - PROJECT

let project = Project(name: "MovieInfo",
                      organizationName: "joaoribeiroteam",
                      settings: projectSettings,
                      targets: [
                        movieInfoTarget,
                        testsTarget
                      ])
