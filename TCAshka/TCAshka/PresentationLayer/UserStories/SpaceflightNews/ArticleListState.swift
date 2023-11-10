//
//  ArticleListState.swift
//  TCAshka
//
//  Created by Stanislav on 08.11.2023.
//

import Foundation
import ComposableArchitecture

// MARK: - ArticleListState

public struct ArticleListState: Equatable {
    
    // MARK: - Properties
    
    /// Loader disable
    public var isLoaderActive = false
    
    /// Selected article with its ID
    public var selectedArticleID: Int?
    
    // MARK: - Children
    
    /// Array of type `InteractiveListItemState` in the `IndentifiedArrayOf` wrapper
    public var articles = IdentifiedArrayOf<ArticleListItemState>()
    
    /// Instance `ArticlePageState`
    public var articlePage: ArticlePageState?
    
    // MARK: - Navigation
    
    public var isArticlePageActive = false
}
