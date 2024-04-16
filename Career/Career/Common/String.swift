import Foundation

extension String {
    func encodedURL() -> URL {
        guard let encodedStringUrl = addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: encodedStringUrl) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
}
