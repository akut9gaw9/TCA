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
    
    /// Unique element id
    public let id: UUID
    
    /// Element title
    public let title: String
    
    /// Item Image
    public let image: Image
    
    /// Item color
    public let color: Color
    
    /// Item checked type
    public var isChecked = false
    
}

// MARK: - Useful

extension InteractiveListItemState {

    /// Creates an array of type `InteractiveListItemState`
    /// - Returns: array of type `InteractiveListItemState`
    static func randomListItems() -> [InteractiveListItemState] {
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
    static func createItem() -> InteractiveListItemState {
        InteractiveListItemState(
            id: UUID(),
            title: Constants.Item.ItemTitle.allCases.randomElement().unsafelyUnwrapped.description,
            image: Constants.Item.ItemImage.allCases.randomElement().unsafelyUnwrapped.image,
            color: Constants.Item.ItemColor.allCases.randomElement().unsafelyUnwrapped.color
        )
    }
}



