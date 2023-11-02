//
//  DoubleCounterReducer.swift
//  TCAshka
//
//  Created by Stanislav on 27.10.2023.
//

import ComposableArchitecture

// MARK: - DoubleCounterReducer

public struct DoubleCounterReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<DoubleCounterState, DoubleCounterAction> {
        Scope(state: \.counter1, action: /DoubleCounterAction.counter1) {
            CounterReducer()
        }
        Scope(state: \.counter2, action: /DoubleCounterAction.counter2) {
            CounterReducer()
        }
        Reduce { state, action in
            switch action {
            case .counter1(.decrementButtonTapped), .counter1(.incrementButtonTapped):
                state.sequenceCounter1Text += " \(state.counter1.count)"
            case .counter2(.decrementButtonTapped), .counter2(.incrementButtonTapped):
                state.sequenceCounter2Text += " \(state.counter2.count)"
            case .counter1(.resetButtonTapped):
                state.sequenceCounter1Text = ""
            case .counter2(.resetButtonTapped):
                state.sequenceCounter2Text = ""
            }
            return .none
        }
    }
}
