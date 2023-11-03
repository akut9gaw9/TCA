//
//  ModelCounterReducer.swift
//  TCAshka
//
//  Created by Stanislav on 02.11.2023.
//

import Foundation
import ComposableArchitecture

// MARK: - MainReducer

public struct MainReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<MainState, MainAction> {
        Scope(state: \.counter, action: /MainAction.counter) {
            CounterReducer()
        }
        Scope(state: \.fibonacciCounter, action: /MainAction.fibonacciCounter) {
            FibonacciCounterReducer()
        }
        Scope(state: \.doubleCounter, action: /MainAction.doubleCounter) {
            DoubleCounterReducer()
        }
        Scope(state: \.counterBinding, action: /MainAction.counterBinding) {
            CounterBindingReducer()
        }
        Reduce { state, action in
            switch action {
            case .onItemTap(let itemType):
                switch itemType {
                case .counter:
                    return .send(.setCounterActive(true))
                case .fibonacciCounter:
                    return .send(.setFibonacciCounterActive(true))
                case .doubleCounter:
                    return .send(.setDoubleCounterActive(true))
                case .counterBinding:
                    return .send(.setCounterBindingActive(true))
                }
            case .setCounterActive(let isActive):
                state.isCounterActive = isActive
            case .setFibonacciCounterActive(let isActive):
                state.isFibonacciCounterActive = isActive
            case .setDoubleCounterActive(let isActive):
                state.isDoubleCounterActive = isActive
            case .setCounterBindingActive(let isActive):
                state.isCounterBindingActive = isActive
            default:
                break
            }
            return .none
        }
    }
}
