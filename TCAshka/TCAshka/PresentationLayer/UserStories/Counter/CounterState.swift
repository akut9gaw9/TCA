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
    
    /// Common computed variable to disable the `plus` and `reset` button's action
    public var isButtonOff = true
}
