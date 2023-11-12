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
                return spaceflightService.obtainArticles(
                    hasEvent: true,
                    hasLaunch: true
                )
                .publish()
                .map(SpaceflightServiceAction.articleListObtained)
                .catchToEffect(ArticleListAction.listArticlesNews)
            case .listArticlesNews(.success(.articleListObtained(let articles))):
                state.articles = IdentifiedArray(uniqueElements: articles.map(ArticleListItemState.init))
                state.isLoaderActive = false
            case .item(id: let id, action: .onTap):
                var transition = state.transition
                switch transition {
                case .instant:
                    state.articles[id: id]?.isLoader = false
                    state.articlePage = ArticlePageState(id: id)
                    state.articlePage?.isLoader = true
                    return .send(.setArticlePageActive(true))
                case .expectation:
                    return spaceflightService.obtainArticle(id: id)
                        .publish()
                        .map(SpaceflightServiceAction.articleObtained)
                        .catchToEffect(ArticleListAction.listArticlesNews)
                }
            case .listArticlesNews(.success(.articleObtained(let article))):
                state.articles[id: article.id]?.isLoader = false
                state.articlePage = ArticlePageState(article: article)
                return .send(.setArticlePageActive(true))
            case .setArticlePageActive(let isActive):
                state.isArticlePageActive = isActive
            case .setLoaderActive(let isActive):
                state.isLoaderActive = isActive
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
