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
    
    case onAppear
    
    case listArticlesNews(Result<SpaceflightServiceAction, NSError>)
    
    // MARK: - Children
    
    case item(id: UUID, action: ArticleListItemAction)
}
