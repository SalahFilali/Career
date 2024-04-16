import Foundation

public enum AppEnvironment: String {
    case preprod, prod
}

extension AppEnvironment {
    static var dataURL: URL {
        return "https://raw.githubusercontent.com/medomar/CareerData/main/home-data.json".encodedURL()
    }
}
