import Foundation

struct AppMission: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case url
    }
}

// Example function to fetch and decode the JSON, assuming the URL is accessible and valid.
extension AppMission {
    static func collection() async -> [AppMission] {
        let session = URLSession.shared
        do {
            let (data, _) = try await session.data(from: AppEnvironment.dataURL)
            let collection = try JSONDecoder().decode([AppMission].self, from: data)
            return collection
        } catch {
            print("Error fetching or decoding data: \(error)")
            return []
        }
    }
    static func fullDemoCompanyData(from url: String) async throws -> AppMission {
        let session = URLSession.shared
        let (data, _) = try await session.data(from: url.encodedURL())
        do {
            let demoCompany = try JSONDecoder().decode(AppMission.self, from: data)
            return demoCompany
        } catch {
            throw error
        }
    }
}

extension AppMission: SmallCardProtocol {
    var titleHintString: String {
        return "Mission Name :"
    }
    var titleValueString: String {
        return title
    }
    var headLineString: String {
        return "Description :"
    }
    var headValueString: String {
        return description
    }
}
