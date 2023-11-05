//
//  InteractiveListState.swift
//  TCAshka
//
//  Created by Stanislav on 04.11.2023.
//

import ComposableArchitecture

// MARK: - InteractiveListState

public struct InteractiveListState: Equatable {
    
    // MARK: - Children
    
    public var items = IdentifiedArrayOf<InteractiveListItemState>()
}
