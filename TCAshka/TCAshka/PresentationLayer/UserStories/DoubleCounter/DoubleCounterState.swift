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
    
    /// Sum of numbers of two counters
    public var sum: Int {
        counter1.count + counter2.count
    }
    
    /// A string displaying the sequence of numbers used in the `counter1`
    public var sequenceCounter1Text = ""
    
    /// A string displaying the sequence of numbers used in the `counter2`
    public var sequenceCounter2Text = ""
    
    // MARK: - Children
    
    /// First instance `CounterState`
    public var counter1 = CounterState()
    
    /// Second instance `CounterState`
    public var counter2 = CounterState()
}
