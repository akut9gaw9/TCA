//
//  ArticleListView.swift
//  TCAshka
//
//  Created by Stanislav on 08.11.2023.
//

import SwiftUI
import ComposableArchitecture
import HTTPTransport

// MARK: - ArticleListView

public struct ArticleListView: View {
    
    // MARK: - Properties
    
    public let store: StoreOf<ArticleListReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            List {
                ForEachStore(
                    store.scope(
                        state: \.articles,
                        action: ArticleListAction.item
                    ),
                    content: ArticleListItemView.init
                )
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ArticleListView(
        store: Store(
            initialState: ArticleListState(),
            reducer: ArticleListReducer(
                spaceflightService: SpaceflightServiceImpementation(
                    transport: HTTPTransport()
                )
            )
        )
    )
}
