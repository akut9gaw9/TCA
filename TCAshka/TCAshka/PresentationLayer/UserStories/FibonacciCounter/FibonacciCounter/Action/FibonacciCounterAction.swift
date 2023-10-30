//
//  CounterAction.swift
//  TCAshka
//
//  Created by Stanislav on 26.10.2023.
//

import Foundation

// MARK: - CounterAction

public enum FibonacciCounterAction: Equatable {
    
    // MARK: - Cases
    
    /// Decreases `count ` by one
    case decrementButtonTapped
    
    /// Increases `count` by one
    case incrementButtonTapped
    
    /// Reset `count` and `number` to zero
    case resetButtonTapped
}
