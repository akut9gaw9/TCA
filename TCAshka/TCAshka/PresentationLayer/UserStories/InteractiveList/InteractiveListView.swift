//
//  InteractiveListView.swift
//  TCAshka
//
//  Created by Stanislav on 04.11.2023.
//

import SwiftUI
import ComposableArchitecture

// MARK: - InteractiveListView

public struct InteractiveListView: View {
    
    // MARK: - Properties
    
    /// The store powering the `InteractiveList` feature
    public var store: StoreOf<InteractiveListReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                Form {
                    Section {
                        ForEachStore(
                            store.scope(
                                state: \.items,
                                action: InteractiveListAction.item(id:action:)
                            ),
                            content: InteractiveListItemView.init
                        )
                        .onDelete { indexToDelete in
                            viewStore.send(.delete(indexToDelete))
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .textCase(nil)
                }
                .navigationBarItems(trailing:
                                        Button {
                    viewStore.send(.addRandom, animation: .default)
                } label: {
                    Text("Add")
                }
                )
                .navigationTitle("Basic list")
                .onAppear {
                    viewStore.send(.onAppear)
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    InteractiveListView(
        store: Store(
            initialState: InteractiveListState(),
            reducer: InteractiveListReducer()
        )
    )
}
