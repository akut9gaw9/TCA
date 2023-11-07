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
    
    public var sectionsOne: Set<String> = []
    
    /// A dictionary that stores the first letters of each element of the `items` array for convenient creation of sections in View
    public var sections: [String : [InteractiveListItemState]] {
        Dictionary(grouping: self.items.elements, by: { element -> String in
            return String(element.title.first.unsafelyUnwrapped)
        })
    }
    
    // MARK: - Children
    
    /// Array of type `InteractiveListItemState` in the `IndentifiedArrayOf` wrapper
    public var items = IdentifiedArrayOf<InteractiveListItemState>()
}
