//
//  Reducer.swift
//  TCAshka
//
//  Created by Stanislav on 26.10.2023.
//

import TCA

// MARK: - CounterFeature

public struct CounterFeature: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public func reduce(into state: inout CounterState, action: CounterAction) -> EffectTask<CounterAction> {
        switch action {
        case .decrementButtonTapped:
            state.count += 1
            state.number = state.count.fibonacciNumCalculation(num: state.count)
        case .incrementButtonTapped:
            state.count -= 1
            state.number = state.count.fibonacciNumCalculation(num: state.count)
        case .resetButtonTapped:
            state.count = 0
            state.number = 0
        }
        return .none
    }
}
