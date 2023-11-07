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
                let sections = viewStore.sections.keys.map{ $0 }.sorted()
                ForEach(sections, id: \.self) { key in
                    Section {
                        ForEachStore(
                            store.scope(
                                state: { state in
                                    IdentifiedArray(uniqueElements: state.sections[key] ?? [])
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
                        Text(key.description)
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
        InteractiveListView(
            store: Store(
                initialState: InteractiveListState(),
                reducer: InteractiveListReducer()
            )
        )
}
