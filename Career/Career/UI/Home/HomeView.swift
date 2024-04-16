import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel

    init() {
        _viewModel = StateObject(wrappedValue: HomeViewModel())
    }

    var body: some View {
        Group {
#if os(macOS)
            MacSidebarNavigationView(viewModel: viewModel)
#else
            TabView {
                AllAppMissionView()
                    .tabItem {
                        Label("All Mission", systemImage: "flame.fill") // Updated for clarity and visual impact
                    }
                FavoriteAppMissionView()
                    .tabItem {
                        Label("Favorite", systemImage: "clock.arrow.circlepath") // Updated for clarity and relevance
                    }
            }
#endif
        }
        .navigationTitle(viewModel.title) // Sets the navigation bar title to the title provided by the viewModel.
    }
}

#if os(macOS)
struct MacSidebarNavigationView: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    AllAppMissionView()
                } label: {
                    Label("All Mission", systemImage: "clock.arrow.circlepath") // Updated for clarity and relevance
                }
                NavigationLink {
                    FavoriteAppMissionView()
                } label: {
                    Label("Favorite", systemImage: "flame.fill") // Updated for clarity and visual impact
                }
            }
            .listStyle(SidebarListStyle()) // Use the sidebar list style for macOS
            .frame(minWidth: 200, idealWidth: 250, maxWidth: 300, maxHeight: .infinity)
            AllAppMissionView()
        }
    }
}
#endif

#Preview {
    HomeView()
}
