//
//  DoubleCounterAction.swift
//  TCAshka
//
//  Created by Stanislav on 27.10.2023.
//

import Foundation

// MARK: - DoubleCounterAction

public enum DoubleCounterAction: Equatable {
    
    // MARK: - Children
    
    /// Handling events using a child action `CounterAction`
    case counter1(CounterAction)
    
    /// Handling events using a child action `CounterAction`
    case counter2(CounterAction)
}
