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
    
    private let spaceflightService: SpaceflightService
    
    // MARK: - Initialization
    
    public init(spaceflightService: SpaceflightService) {
        self.spaceflightService = spaceflightService
    }
    
    // MARK: - Reducer
    
    public var body: some Reducer<ArticleListState, ArticleListAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.isLoader = true
                return spaceflightService.obtainArticles(
                    hasEvent: true,
                    hasLaunch: true
                )
                .publish()
                .map(SpaceflightServiceAction.articleListObtained)
                .catchToEffect(ArticleListAction.listArticlesNews)
            case .listArticlesNews(.success(.articleListObtained(let articles))):
                state.articles = IdentifiedArray(uniqueElements: articles.map(ArticleListItemState.init))
                state.isLoader = false
            case .item(id: let id, action: .onTap):
                state.articlePage = ArticlePageState(id: id)
                return .send(.setArticlePageActive(true))
            case .setArticlePageActive(let isActive):
                state.isArticlePageActive = isActive
            default:
                break
            }
            return .none
        }
        .forEach(\.articles, action: /ArticleListAction.item) {
            ArticleListItemReducer()
        }
        .ifLet(\.articlePage, action: /ArticleListAction.articlePage) {
            ArticlePageReducer(spaceflightService: spaceflightService)
        }
    }
}
