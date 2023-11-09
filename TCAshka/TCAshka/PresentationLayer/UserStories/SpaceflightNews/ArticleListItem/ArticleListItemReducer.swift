//
//  ArticleListItemReducer.swift
//  TCAshka
//
//  Created by Stanislav on 08.11.2023.
//

import Foundation
import ComposableArchitecture

// MARK: - ArticleListItemReducer

public struct ArticleListItemReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<ArticleListItemState, ArticleListItemAction> {
        Reduce { state, action in
            switch action {
            case .onTap:
                return .none
            }
        }
    }
}
