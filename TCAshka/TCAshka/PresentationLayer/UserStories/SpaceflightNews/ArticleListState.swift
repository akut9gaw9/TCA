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
    
    // MARK: - Transition
    
    public enum Transition: CaseIterable {
        
        // MARK: - Cases
        
        case instant
        case expectation
        
        /// Propertie that with help feature `randomElement` selected `Transition` case
        public var transition: Transition {
            get {
                Transition.allCases.randomElement().unsafelyUnwrapped
            }
        }
    }
    
    // MARK: - Properties
    
    /// Describes the loader state
    public var isLoaderActive = false
    
    /// Transition type
    public var transition: Transition {
        get {
            Transition.allCases.randomElement().unsafelyUnwrapped
        }
    }
    
    // MARK: - Children
    
    /// Array of type `InteractiveListItemState` in the `IndentifiedArrayOf` wrapper
    public var articles = IdentifiedArrayOf<ArticleListItemState>()
    
    /// Instance `ArticlePageState`
    public var articlePage: ArticlePageState?
    
    // MARK: - Navigation
    
    public var isArticlePageActive = false
}
