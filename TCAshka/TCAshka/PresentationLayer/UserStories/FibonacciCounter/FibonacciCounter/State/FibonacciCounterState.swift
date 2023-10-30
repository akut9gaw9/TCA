//
//  CounterState.swift
//  TCAshka
//
//  Created by Stanislav on 26.10.2023.
//

import Foundation

// MARK: - CounterState     

public struct FibonacciCounterState: Equatable {
    
    // MARK: - Properties
    
    /// Fibonacci number value by index
    public var number = 0
    
    /// Fibonacci sequence element index
    public var count = 0
    
    /// Computed variable to disable the `plus` button's action
    public var isPlusButtonOff: Bool {
        if count == 15 { return true }
        return false
    }
    
    /// Common computed variable to disable the `plus` and `reset` button's action
    public var isButtonOff: Bool {
        if count == 0 { return true }
        return false
    }
}
