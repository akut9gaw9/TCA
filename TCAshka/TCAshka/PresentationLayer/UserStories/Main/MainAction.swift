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
    
    /// Handles a case from the `Counters` enumeration
    case onCountersTap(MainState.Counters)
    
    /// Handles a case from the `Intermediate` enumeration
    case onIntermediateTap(MainState.Intermediate)
    
    // MARK: - Children
    
    /// Handling events using a child action `CounterAction`
    case counter(CounterAction)
    
    /// Handling events using a child action `FibonacciCounterAction`
    case fibonacciCounter(FibonacciCounterAction)
    
    /// Handling events using a child action `DoubleCounterAction`
    case doubleCounter(DoubleCounterAction)
    
    /// Handling events using a child action `CounterBindingAction`
    case counterBinding(CounterBindingAction)
    
    /// Handling events using a child action `InteractiveListAction`
    case interactiveList(InteractiveListAction)
    
    // MARK: - Navigation
    
    /// Case when the `Counter` is active
    case setCounterActive(Bool)
    
    /// Case when the `FibonacciCounter` is active
    case setFibonacciCounterActive(Bool)
    
    /// Case when the `DoubleCounter` is active
    case setDoubleCounterActive(Bool)
    
    /// Case when the `CounterBinding` is active
    case setCounterBindingActive(Bool)
    
    /// Case when the `InteractiveList` is active
    case setInteractiveListActive(Bool)
}
