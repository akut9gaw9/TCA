//
//  Reducer.swift
//  TCAshka
//
//  Created by Stanislav on 26.10.2023.
//

import ComposableArchitecture

// MARK: - CounterFeature

public struct FibonacciCounterReducer: Reducer {

    // MARK: - Useful
    
    /// Calculates the Fibonacci number using the specified index
    /// - Parameter index: element index
    /// - Returns: number at the specified index
    public func fibonacciNumCalculation(withIndex index: Int) -> Int {
        if index == 0 { return 0 }
        if index == 1 { return 1 }
        return fibonacciNumCalculation(withIndex: index - 1) + fibonacciNumCalculation(withIndex: index - 2)
    }
    
    // MARK: - Reducer
    
    public func reduce(into state: inout FibonacciCounterState, action: FibonacciCounterAction) -> Effect<FibonacciCounterAction> {
        switch action {
        case .decrementButtonTapped:
            state.count += 1
            state.number = fibonacciNumCalculation(withIndex: state.count)
        case .incrementButtonTapped:
            state.count -= 1
            state.number = fibonacciNumCalculation(withIndex: state.count)
        case .resetButtonTapped:
            state.count = 0
            state.number = 0
        }
        return .none
    }
}
