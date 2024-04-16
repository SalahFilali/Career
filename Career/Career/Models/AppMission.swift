import Foundation

struct Location: Codable {
    let city: String
    let country: String
    let remote: String
}

struct Company: Codable {
    let name: String
    let contactEmail: String
    let contactPhone: String
}

struct Contact: Codable {
    let name: String
    let email: String
    let phone: String
}

struct Client: Codable {
    let name: String
    let industry: String
    let contact: Contact
}

struct Application: Codable {
    let email: String
    let phone: String
}

struct AppMission: Codable, Identifiable {
    let id: Int
    let title: String?
    let description: String?
    let technologies: [String]?
    let duration: String?
    let workType: String?
    let location: Location?
    let company: Company?
    let client: Client?
    let rate: String?
    let start: String?
    let application: Application?
    let notOpenToSubcontractors: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case technologies
        case duration
        case workType
        case location
        case company
        case client
        case rate
        case start
        case application
        case notOpenToSubcontractors
    }
}

// Example function to fetch and decode the JSON, assuming the URL is accessible and valid.
extension AppMission {
    static func collection() async throws -> [AppMission] {
        let session = URLSession.shared
        let (data, _) = try await session.data(from: AppEnvironment.dataURL)
        let collection = try JSONDecoder().decode([AppMission].self, from: data)
        return collection
    }
}

// Example function to fetch and decode the JSON, assuming the URL is accessible and valid.
extension AppMission {
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
        return title ?? "N-A"
    }
    var headLineString: String {
        return "Description :"
    }
    var headValueString: String {
        return description ?? "N-A"
    }
}
