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
    
    // MARK: - Children
    
    /// Array of type `InteractiveListItemState` in the `IndentifiedArrayOf` wrapper
    public var articles = IdentifiedArrayOf<ArticleListItemState>()
}
