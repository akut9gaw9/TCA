//
//  ArticleListAction.swift
//  TCAshka
//
//  Created by Stanislav on 08.11.2023.
//

import Foundation

// MARK: - ArticleListAction

public enum ArticleListAction: Equatable {
    
    // MARK: - Cases
    
    /// Executes a request to retrieve articles when a view appears
    case onAppear
    
    // MARK: - Children
    
    /// Handling actions from ArticelListItemState
    case item(id: ArticleListItemState.ID, action: ArticleListItemAction)
    
    /// Instance `ArticlePageAction`
    case articlePage(ArticlePageAction)
    
    // MARK: - Navigation
    
    /// Sets true or false to screen view status
    case setArticlePageActive(Bool)
    
    /// Sets true or false to loader status
    case setLoaderActive(Bool)
    
    // MARK: - Services
    
    /// Processing success and failure cases of a request
    case listArticlesNews(Result<SpaceflightServiceAction, SpaceflightServiceError>)
}
