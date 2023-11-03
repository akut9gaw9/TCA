//
//  ModuleCounterAction.swift
//  TCAshka
//
//  Created by Stanislav on 02.11.2023.
//

import Foundation

// MARK: - MainAction

public enum MainAction: Equatable {
    
    // MARK: - General
    
    case onItemTap(MainState.Counters)
    
    // MARK: - Children
    
    /// Handling events using a child action `CounterAction`
    case counter(CounterAction)
    
    /// Handling events using a child action `FibonacciCounterAction`
    case fibonacciCounter(FibonacciCounterAction)
    
    /// Handling events using a child action `DoubleCounterAction`
    case doubleCounter(DoubleCounterAction)
    
    /// Handling events using a child action `CounterBindingAction`
    case counterBinding(CounterBindingAction)
    
    // MARK: - Navigation
    
    /// Case when the `Counter` is active
    case setCounterActive(Bool)
    
    /// Case when the `FibonacciCounter` is active
    case setFibonacciCounterActive(Bool)
    
    /// Case when the `DoubleCounter` is active
    case setDoubleCounterActive(Bool)
    
    /// Case when the `CounterBinding` is active
    case setCounterBindingActive(Bool)
}
