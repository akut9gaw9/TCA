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
            if viewStore.isLoader {
                ProgressView()
                    .scaleEffect(2)
            } else {
                List {
                    ForEachStore(
                        store.scope(
                            state: \.articles,
                            action: ArticleListAction.item
                        ),
                        content: ArticleListItemView.init
                    )
                }
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isArticlePageActive,
                            send: ArticleListAction.setArticlePageActive
                        ),
                        destination: {
                            IfLetStore(
                                store.scope(
                                    state: \.articlePage,
                                    action: ArticleListAction.articlePage
                                ),
                                then: ArticlePageView.init
                            )
                        },
                        label: { EmptyView() }
                    )
                )
                .onAppear {
                    if viewStore.articles.isEmpty {
                        viewStore.send(.onAppear)
                    }
                }
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
