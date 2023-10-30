//
//  CounterAction.swift
//  TCAshka
//
//  Created by Stanislav on 27.10.2023.
//

import Foundation

// MARK: - CounterAction

public enum CounterAction: Equatable {
    
    // MARK: - Cases
    
    /// Decreases `count` by one
    case decrementButtonTapped
    
    /// Increases `count` by one
    case incrementButtonTapped
    
    /// Reset `count`to zero
    case resetButtonTapped
}
