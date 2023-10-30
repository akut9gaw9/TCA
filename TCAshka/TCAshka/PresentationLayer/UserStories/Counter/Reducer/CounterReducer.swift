//
//  CounterReducer.swift
//  TCAshka
//
//  Created by Stanislav on 27.10.2023.
//

import ComposableArchitecture

// MARK: - CounterReducer

public struct CounterReducer: Reducer {
    
    // MARK: - Reducer
    
    public func reduce(into state: inout CounterState, action: CounterAction) -> Effect<CounterAction> {
        switch action {
        case .decrementButtonTapped:
            state.count += 1
        case .incrementButtonTapped:
            state.count -= 1
        case .resetButtonTapped:
            state.count = 0
            state.sequence = ""
        }
        return .none
    }
}

