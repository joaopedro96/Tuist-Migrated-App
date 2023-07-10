
import ProjectDescription

let project = Project(
    name: "MovieInfo",
    organizationName: "joaoribeiroteam",
    settings: nil,
    targets: [
        Target(
            name: "MovieInfo",
            platform: .iOS,
            product: .app,
            bundleId: "co.joaoribeiro",
            infoPlist: "MovieInfo/Info.plist",
            sources: ["MovieInfo/Source/**"],
            resources: ["MovieInfo/Resources/**"],
            dependencies: [],
            settings: nil)
    ]
)
