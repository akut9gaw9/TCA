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
            Form {
                ForEach(viewStore.sections, id: \.self) { symbol in
                    Section {
                        ForEachStore(
                            store.scope(
                                state: { state in
                                    state.items.filter { $0.title.hasPrefix(symbol) }
                                },
                                action: InteractiveListAction.item
                            ),
                            content: { store in
                                InteractiveListItemView(store: store)
                            }
                        )
                        .onDelete { indexToDelete in
                            viewStore.send(.delete(indexToDelete))
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .textCase(nil)
                    } header: {
                        Text(symbol)
                    }
                }
            }
            .navigationTitle("Basic list")
            .toolbar {
                Button {
                    viewStore.send(.addRandom, animation: .default)
                } label: {
                    Text("Add")
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationView {
        InteractiveListView(
            store: Store(
                initialState: InteractiveListState(),
                reducer: InteractiveListReducer()
            )
        )
    }
}
