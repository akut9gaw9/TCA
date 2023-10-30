//
//  DoubleCounterState.swift
//  TCAshka
//
//  Created by Stanislav on 27.10.2023.
//

import Foundation

// MARK: - DoubleCounterState

public struct DoubleCounterState: Equatable {
    
    // MARK: - Properties
    
    /// First instance `CounterState`
    public var counter1 = CounterState()
    
    /// Second instance `CounterState`
    public var counter2 = CounterState()
    
    /// Sum of numbers of two counters
    public var sum: Int {
        self.counter1.count + self.counter2.count
    }
}
