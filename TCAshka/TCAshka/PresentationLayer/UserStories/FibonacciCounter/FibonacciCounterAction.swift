//
//  CounterAction.swift
//  TCAshka
//
//  Created by Stanislav on 26.10.2023.
//

import Foundation

// MARK: - FibonacciCounterAction

public enum FibonacciCounterAction: Equatable {
    
    // MARK: - Children
    
    /// Handling events using a child action `CounterAction`
    case counter(CounterAction)
}
