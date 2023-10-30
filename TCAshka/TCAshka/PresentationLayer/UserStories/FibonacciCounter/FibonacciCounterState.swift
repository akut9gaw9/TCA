//
//  CounterState.swift
//  TCAshka
//
//  Created by Stanislav on 26.10.2023.
//

import Foundation

// MARK: - FibonacciCounterState

public struct FibonacciCounterState: Equatable {
    
    // MARK: - Properties
    
    /// Fibonacci number value by index
    public var number = 0
    
    // MARK: - Childer
    
    /// Instance `CounterState`
    public var counter = CounterState()
}
