//
//  ArticleListReducer.swift
//  TCAshka
//
//  Created by Stanislav on 08.11.2023.
//

import Foundation
import ComposableArchitecture

// MARK: - ArticleListReducer

public struct ArticleListReducer: Reducer {
    
    // MARK: - Properties
    
    var spaceflightService: SpaceflightService
    
    // MARK: - Initialization
    
    public init(spaceflightService: SpaceflightService) {
        self.spaceflightService = spaceflightService
    }
    
    // MARK: - IDs
    
    private struct ItemCheckingID: Hashable {}
    
    // MARK: - Reducer
    
    public var body: some Reducer<ArticleListState, ArticleListAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return spaceflightService.obtainArticles(
                    hasEvent: true,
                    hasLaunch: true
                )
                .publish()
                .map(SpaceflightServiceAction.articlesObtained)
                .catchToEffect(ArticleListAction.listArticlesNews)
            case .listArticlesNews(.success(.articlesObtained(let articles))):
                state.articles = IdentifiedArray(uniqueElements: articles.map(ArticleListItemState.init))
            case .item(id: _, action: .onAppear):
                print("test")
            default:
                break
            }
            return .none
        }
        .forEach(\.articles, action: /ArticleListAction.item) {
            ArticleListItemReducer()
        }
    }
}
