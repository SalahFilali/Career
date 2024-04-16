import Foundation


@MainActor class AllAppMissionViewModel: ObservableObject {

    @Published var title: String = "Challenges"

    @Published var collection: [AppMission] = []

    init() {
    }
}
