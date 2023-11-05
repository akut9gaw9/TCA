//
//  InteractiveListItemState.swift
//  TCAshka
//
//  Created by Stanislav on 04.11.2023.
//

import SwiftUI

// MARK: - InteractiveListItemState

public struct InteractiveListItemState: Identifiable, Equatable {
    
    // MARK: - Properties
    
    public let id: UUID
    
    public let title: String
    
    public let image: Image
    
    public let color: Color
    
    public var isChecked = false
    
}

// MARK: - Useful

/// Creates an array of type `InteractiveListItemState`
/// - Returns: array of type `InteractiveListItemState`
public func randomListItems() -> [InteractiveListItemState] {
    var listItems = [InteractiveListItemState]()
    let randomNumber = Int.random(in: 10..<15)
    for _ in 0...randomNumber {
        listItems.append(
            InteractiveListItemState(
                id: UUID(),
                title: Constants.Item.ItemTitle.allCases.randomElement()!.description,
                image: Constants.Item.ItemImage.allCases.randomElement()!.image,
                color: Constants.Item.ItemColor.allCases.randomElement()!.color
            )
        )
    }
    return listItems
}

/// Creates an object of type `InteractiveListItemState`
/// - Returns: object of type `InteractiveListItemState`
public func createItem() -> InteractiveListItemState {
    InteractiveListItemState(
        id: UUID(),
        title: Constants.Item.ItemTitle.allCases.randomElement()!.description,
        image: Constants.Item.ItemImage.allCases.randomElement()!.image,
        color: Constants.Item.ItemColor.allCases.randomElement()!.color
    )
}

