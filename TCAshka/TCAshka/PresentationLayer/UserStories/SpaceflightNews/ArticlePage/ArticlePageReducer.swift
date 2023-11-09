//
//  ArticlePageReducer.swift
//  TCAshka
//
//  Created by Stanislav on 09.11.2023.
//

import Foundation
import ComposableArchitecture

// MARK: - ArticlePageReducer

public struct ArticlePageReducer: Reducer {
    
    // MARK: - Properties
    
    private let spaceflightService: SpaceflightService
    
    // MARK: - Initialization
    
    public init(spaceflightService: SpaceflightService) {
        self.spaceflightService = spaceflightService
    }
    
    // MARK: - Reducer
    
    public var body: some Reducer<ArticlePageState, ArticlePageAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return spaceflightService
                    .obtainArticle(id: state.id)
                    .publish()
                    .map(SpaceflightServiceAction.articleObtained)
                    .catchToEffect(ArticlePageAction.listArticlesNews)
            case .listArticlesNews(.success(.articleObtained(let article))):
                state.id = article.id
                state.title = article.title
                state.imageURL = article.imageURL
                state.author = article.author
                state.publicationDate = article.publishedAt
                state.readingTime = article.readingTime
                state.summary = article.content
            default:
                break
            }
            return .none
        }
    }
}
