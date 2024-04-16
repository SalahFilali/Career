import Foundation


@MainActor class FavoriteAppMissionViewModel: ObservableObject {

    @Published var title: String = "History"

    @Published var collection: [AppMission] = []

    init() {
    }
}
