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
    
    /// InteractiveItem Image
    public let imageName: String
    
    /// InteractiveItem color
    public let color: Color
    
    /// InteractiveItem checked type
    public var isChecked = false
}

// MARK: - Useful

extension InteractiveListItemState {
    
    /// Creates an array of type `InteractiveListItemState`
    /// - Returns: array of type `InteractiveListItemState`
    static func randomListItems() -> [InteractiveListItemState] {
        let cases = InteractiveItem.allCases
        var listItems = [InteractiveListItemState]()
        let randomNumber = Int.random(in: 10..<15)
        for _ in 0...randomNumber {
            let randomItem = cases.randomElement().unsafelyUnwrapped
            listItems.append(
                InteractiveListItemState(
                    id: UUID(),
                    title: randomItem.title,
                    imageName: randomItem.randomImageName,
                    color: randomItem.randomColor
                )
            )
        }
        return listItems
    }
    
    /// Creates an object of type `InteractiveListItemState`
    /// - Returns: object of type `InteractiveListItemState`
    static func createItem() -> InteractiveListItemState {
        let randomItem = InteractiveItem.allCases.randomElement().unsafelyUnwrapped
        return InteractiveListItemState(
            id: UUID(),
            title: randomItem.title,
            imageName: randomItem.randomImageName,
            color: randomItem.randomColor
        )
    }
}

// MARK: - InteractiveItem

private enum InteractiveItem: String, CaseIterable {
    
    // MARK: - Cases
    
    case andrew
    case dmitry
    case gleb
    case roma
    case stas
    
    // MARK: - Properties
    
    var title: String {
        rawValue.capitalizingFirstLetter
    }
    
    var randomImageName: String {
        [
            "heart.fill",
            "cross.case.fill",
            "microbe.circle.fill",
            "facemask.fill"
        ].randomElement().unsafelyUnwrapped
    }
    
    var randomColor: Color {
        [
            .red,
            .blue,
            .purple,
            .green
        ].randomElement().unsafelyUnwrapped
    }
}
