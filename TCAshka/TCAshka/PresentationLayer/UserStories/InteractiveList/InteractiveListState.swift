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
    
    /// A dictionary that stores the first letters of each element of the `items` array for convenient creation of sections in View
    public var sections: [Character : [InteractiveListItemState]] {
        Dictionary(grouping: self.items.elements, by: { element -> Character in
            return element.title.first.unsafelyUnwrapped
        })
    }
    
    // MARK: - Children
    
    /// Array of type `InteractiveListItemState` in the `IndentifiedArrayOf` wrapper
    public var items = IdentifiedArrayOf<InteractiveListItemState>()
}
