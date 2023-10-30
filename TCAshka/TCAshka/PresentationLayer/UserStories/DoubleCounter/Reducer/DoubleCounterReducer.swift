//
//  DoubleCounterReducer.swift
//  TCAshka
//
//  Created by Stanislav on 27.10.2023.
//

import ComposableArchitecture

// MARK: - DoubleCounterReducer

public struct DoubleCounterReducer: Reducer {
    
    // MARK: - Useful
    
    /// Monitoring child reducers
    public var body: some Reducer<DoubleCounterState, DoubleCounterAction> {
        Scope(state: \.counter1, action: /DoubleCounterAction.counter1) {
            CounterReducer()
        }
        
        Scope(state: \.counter2, action: /DoubleCounterAction.counter2) {
            CounterReducer()
        }
    }
}
