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
    
    /// Processing success and failure cases of a request
    case listArticlesNews(Result<SpaceflightServiceAction, NSError>)
    
    // MARK: - Children
    
    case item(id: UUID, action: ArticleListItemAction)
}
