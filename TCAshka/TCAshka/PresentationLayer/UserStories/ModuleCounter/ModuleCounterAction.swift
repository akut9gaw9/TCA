//
//  ModuleCounterAction.swift
//  TCAshka
//
//  Created by Stanislav on 02.11.2023.
//

import Foundation

public enum ModuleCounterAction: Equatable {
    
    // MARK: - Cases
    
    // MARK: - Children
    
    case counterAction(CounterAction)
    
    case fibonacciCounterAction(FibonacciCounterAction)
    
    case doubleCounterAction(DoubleCounterAction)
    
    case counterBinding(CounterBindingAction)
    
    // MARK: - Navigation
    
    case setCounterActive(Bool)
    
    case setFibonacciCounterActive(Bool)
    
    case setDoubleCounterActive(Bool)
    
    case setCounterBindingActive(Bool)
}
