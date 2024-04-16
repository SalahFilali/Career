import Foundation


@MainActor class AllAppMissionViewModel: ObservableObject {
    @Published var collection: [AppMission] = []
    @Published public private(set) var isLoading = false
    @Published var viewTitle: String = "All Mission"

    init() {}
    func fetchData() {
        Task {
            isLoading = true
            do {
                collection = try await AppMission.collection()
                isLoading = false
            } catch {
                isLoading = false
            }
        }
    }
}
