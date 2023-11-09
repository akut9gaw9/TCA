//
//  ArticlePageAction.swift
//  TCAshka
//
//  Created by Stanislav on 09.11.2023.
//

import Foundation

// MARK: - ArticlePageAction

public enum ArticlePageAction: Equatable {
    
    // MARK: - Cases
    
    /// Wrappred data in `Effect`
    case onAppear
    
    // MARK: - Services
    
    /// Processing success and failure cases of a request
    case listArticlesNews(Result<SpaceflightServiceAction, SpaceflightServiceError>)
}
