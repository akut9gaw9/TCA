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
    
    case onAppear
    
    case updateItems
    
    case addRandom
    
    case removeCheckedItems
    
    case delete(IndexSet)
    
    // MARK: - Children
    
    case item(id: UUID, action: InteractiveListItemAction)
}
