//
//  ModuleCounterState.swift
//  TCAshka
//
//  Created by Stanislav on 02.11.2023.
//

import Foundation

// MARK: - ModuleCounterState

public struct ModuleCounterState: Equatable {
    
    // MARK: - Properties
    
    // MARK: - Children
    
    public var counter = CounterState()
    
    public var fibonacciCounter = FibonacciCounterState()
    
    public var doubleCounter = DoubleCounterState()
    
    public var counterBinding = CounterBindingState()
    
    // MARK: - Navigation
    
    public var isCounterActive = false
    
    public var isFibonacciCounterActive = false
    
    public var isDoubleCounterActive = false
    
    public var isCounterBindingActive = false
    
}
