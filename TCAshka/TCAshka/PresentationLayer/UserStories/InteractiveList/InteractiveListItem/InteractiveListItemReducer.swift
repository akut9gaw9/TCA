//
//  InteractiveListItemReducer.swift
//  TCAshka
//
//  Created by Stanislav on 04.11.2023.
//

import ComposableArchitecture
import SwiftUI

// MARK: - InteractiveListItemReducer

public struct InteractiveListItemReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<InteractiveListItemState, InteractiveListItemAction> {
        Reduce { state, action in
            switch action {
            case .checkBoxToggle:
                state.isChecked.toggle()
                return .none
            }
        }
    }
}

