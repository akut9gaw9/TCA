//
//  ModelCounterReducer.swift
//  TCAshka
//
//  Created by Stanislav on 02.11.2023.
//

import Foundation
import ComposableArchitecture

// MARK: - ModuleCounterReducer

public struct ModuleCounterReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<ModuleCounterState, ModuleCounterAction> {
        Scope(
            state: \.counter,
            action: /ModuleCounterAction.counterAction) {
                CounterReducer()
            }
        Scope(
            state: \.fibonacciCounter,
            action: /ModuleCounterAction.fibonacciCounterAction) {
                FibonacciCounterReducer()
            }
        Scope(
            state: \.doubleCounter,
            action: /ModuleCounterAction.doubleCounterAction) {
                DoubleCounterReducer()
            }
        Scope(
            state: \.counterBinding,
            action: /ModuleCounterAction.counterBinding) {
                CounterBindingReducer()
            }
        Reduce { state, action in
            switch action {
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
