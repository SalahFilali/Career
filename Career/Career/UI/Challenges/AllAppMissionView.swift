import SwiftUI
import CoreData

struct AllAppMissionView: View {
    @StateObject private var viewModel: AllAppMissionViewModel

    init() {
        _viewModel = StateObject(wrappedValue: AllAppMissionViewModel())
    }

    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    if viewModel.collection.isEmpty {
                        ContentUnavailableView {
                            VStack(alignment: .center) {
                                Image(systemName: "exclamationmark.icloud.fill") // Updated system image
                                    .font(.largeTitle)
                                    .padding()
                                Text("Challenges Currently Unavailable")
                                    .font(.title)
                                    .fontWeight(.semibold)
                            }
                        } description: {
                            VStack(alignment: .center) {
                                Text("Nothing to See Here... Yet!")
                                    .font(.largeTitle)
                                    .padding()
                                Text("Looks like we're out of challenges at the moment. Ensure your internet connection is active or check back later. We're probably adding more exciting challenges!")
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .padding()
                            }
                        }
                    } else {
                        ForEach(viewModel.collection) { item in
                            NavigationLink {
                                Text("Details")
                            } label: {
                                SmallCardView(smallCardObject: item)
                            }
                        }
                    }
                }
                if viewModel.isLoading {
                    LoadingView()
                }
            }
            .navigationTitle(viewModel.viewTitle)
#if os(iOS)
            .navigationBarTitleDisplayMode(.large)
#endif
            .toolbar {
                ToolbarItemGroup(placement: Toolbar.leadingToolbarItemPlacement ) {
                    leadingBarItems
                }
                ToolbarItemGroup(placement: Toolbar.trailingToolbarItemPlacement ) {
                    trailingBarItems
                }
            }
            .onAppear {
                viewModel.fetchData()
            }
        }
    }

    private var trailingBarItems: some View {
        Button {
            // Action for profile button
        } label: {
            Image(systemName: "exclamationmark.warninglight") // Use filled variant for consistency
        }
    }

    private var leadingBarItems: some View {
        EmptyView() // Placeholder for potential future UI elements
    }
}

#Preview {
    AllAppMissionView()
}
