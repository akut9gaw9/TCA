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
    public var count = 0 {
        didSet {
            sequence += " \(count)"
        }
    }
    
    /// A string that shows the sequence of numbers that were used
    public var sequence = ""
}
