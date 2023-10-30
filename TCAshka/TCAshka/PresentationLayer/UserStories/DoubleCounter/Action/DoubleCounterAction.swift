//
//  DoubleCounterAction.swift
//  TCAshka
//
//  Created by Stanislav on 27.10.2023.
//

import Foundation

// MARK: - DoubleCounterAction

public enum DoubleCounterAction: Equatable {
    
    // MARK: - Cases
    
    case counter1(CounterAction)
    
    case counter2(CounterAction)
}
