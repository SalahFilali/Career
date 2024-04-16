//
//  ContentView.swift
//  PeacePath
//
//  Created by MOHAMED on 06/04/2024.
//

import SwiftUI
import CoreData

struct FavoriteAppMissionView: View {
    @StateObject private var viewModel: FavoriteAppMissionViewModel

    init() {
        _viewModel = StateObject(wrappedValue: FavoriteAppMissionViewModel())
    }


    var body: some View {
        NavigationStack {
            List {
                if viewModel.collection.isEmpty {
                    ContentUnavailableView {
                        VStack(alignment: .center) {
                            Image(systemName: "tray.and.arrow.down.fill")
                                .font(.largeTitle)
                                .padding()
                            Text("History Unavailable")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    } description: {
                        VStack(alignment: .center) {
                            Text("Oops, It's Empty Here!")
                                .font(.largeTitle)
                                .padding()
                            Text("Begin a challenge today to start populating your history. It's a great way to track your progress and achievements.")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .padding()

                        }
                    }
                } else {
                    ForEach(viewModel.collection) { item in
                        NavigationLink {
                            Text("N-A")
                        } label: {
                            Text("N-A")
                        }
                    }
                }
            }
            .navigationTitle(viewModel.title)
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
        }
    }


    private var trailingBarItems: some View {
        Button {

        } label: {
            Image(systemName: "person.crop.circle")
        }
    }
    private var leadingBarItems: some View {
        EmptyView()
    }
}

#Preview {
    FavoriteAppMissionView()
}
