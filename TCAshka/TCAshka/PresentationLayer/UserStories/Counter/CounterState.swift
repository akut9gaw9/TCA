//
//  CounterState.swift
//  TCAshka
//
//  Created by Stanislav on 27.10.2023.
//

import Foundation

// MARK: - CounterState

public struct CounterState: Equatable {
    
    // MARK: - Properties
    
    /// Fibonacci sequence element index
    public var count = 0
    
    /// Variable to disable the `reset` button's action
    public var isResetButtonDisabled = true
    
    /// /// Variable to disable the `minus` button's action
    public var isMinusButtonDisabled = false
}
