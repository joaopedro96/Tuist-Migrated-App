
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

// MARK: - TARGETS

let movieInfoTarget = Target(name: "MovieInfo",
                             platform: .iOS,
                             product: .app,
                             bundleId: "co.joaoribeiro",
                             infoPlist: "MovieInfo/Info.plist",
                             sources: ["MovieInfo/Source/**"],
                             resources: ["MovieInfo/Resources/**"],
                             dependencies: [],
                             settings: targetSettings)

// MARK: - PROJECT

let project = Project(name: "MovieInfo",
                      organizationName: "joaoribeiroteam",
                      settings: projectSettings,
                      targets: [
                        movieInfoTarget
                      ])
