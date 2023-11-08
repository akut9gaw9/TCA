//
//  InteractiveListState.swift
//  TCAshka
//
//  Created by Stanislav on 04.11.2023.
//

import ComposableArchitecture

// MARK: - InteractiveListState

public struct InteractiveListState: Equatable {
    
    // MARK: - Properties
    
    public var sections: [String] {
        Set(
            items.map{
                String($0.title.first.unsafelyUnwrapped)
            }
        ).sorted()
    }
    
    // MARK: - Children
    
    /// Array of type `InteractiveListItemState` in the `IndentifiedArrayOf` wrapper
    public var items = IdentifiedArrayOf<InteractiveListItemState>()
}
