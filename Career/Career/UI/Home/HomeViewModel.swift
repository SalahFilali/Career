import Foundation


@MainActor class HomeViewModel: ObservableObject {

    @Published var title: String = "Home"

    init() {
    }
}
