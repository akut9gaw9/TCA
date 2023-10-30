//
//  Reducer.swift
//  TCAshka
//
//  Created by Stanislav on 26.10.2023.
//

import ComposableArchitecture

// MARK: - FibonacciCounterReducer

public struct FibonacciCounterReducer: Reducer {

    // MARK: - Useful
    
    /// Calculates the Fibonacci number using the specified index
    /// - Parameter index: element index
    /// - Returns: number at the specified index
    public func fibonacciNumCalculation(withIndex index: Int) -> Int {
        switch index {
        case 0:
            return 0
        case 1:
            return 1
        case -1:
            return -1
        case ..<0:
            return fibonacciNumCalculation(withIndex: index + 1) + fibonacciNumCalculation(withIndex: index + 2)
        default:
            return fibonacciNumCalculation(withIndex: index - 1) + fibonacciNumCalculation(withIndex: index - 2)
        }
    }
    
    // MARK: - Reducer
    
    public var body: some Reducer<FibonacciCounterState, FibonacciCounterAction> {
        Scope(state: \.counter, action: /FibonacciCounterAction.counter) {
            CounterReducer()
        }
        Reduce { state, action in
            switch action {
            case .counter(.decrementButtonTapped), .counter(.incrementButtonTapped):
                state.number = fibonacciNumCalculation(withIndex: state.counter.count)
            case .counter(.resetButtonTapped):
                state.number = 0
            }
            return .none
        }
    }
}
