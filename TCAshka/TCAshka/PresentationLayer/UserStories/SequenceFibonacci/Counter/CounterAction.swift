//
//  CounterAction.swift
//  TCAshka
//
//  Created by Stanislav on 26.10.2023.
//

import Foundation

// MARK: - CounterAction

public enum CounterAction: Equatable {
    
    // MARK: - Cases
    
    /// Subtracting the last two numbers of a sequence
    case decrementButtonTapped
    
    /// Adding the last two numbers of a sequence
    case incrementButtonTapped
    
    /// Reset `count` and `number` to zero
    case resetButtonTapped
}
