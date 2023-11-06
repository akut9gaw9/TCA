//
//  InteractiveListAction.swift
//  TCAshka
//
//  Created by Stanislav on 04.11.2023.
//

import Foundation

// MARK: - InteractiveListAction

public enum InteractiveListAction: Equatable {
    
    // MARK: - Cases
    
    /// Case  when view on appeared
    case onAppear
    
    /// The case is fired when the onAppear event occurs and a list of type `InteractiveListItemState` is generated
    case creatingItems
    
    /// Adds an element of type `InteractiveListItemState` with random properties to the list of elements
    case addRandom
    
    /// Occurs when the element's .checkBox Toggle is selected
    case removeCheckedItems
    
    /// Function for deleting an element `onDelete`
    /// An element removal function `onDelete` that requires an `IndexSet` type
    case delete(IndexSet)
    
    // MARK: - Children
    
    /// ?
    case item(id: UUID, action: InteractiveListItemAction)
}
