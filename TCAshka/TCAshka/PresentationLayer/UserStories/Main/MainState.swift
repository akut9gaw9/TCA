//
//  ModuleCounterState.swift
//  TCAshka
//
//  Created by Stanislav on 02.11.2023.
//

import Foundation

// MARK: - MainState

public struct MainState: Equatable {
    
    // MARK: - Counters
    
    /// An enumeration that contains counters
    public enum Counters: String, CaseIterable {
        
        // MARK: - Cases
        
        case counter
        case fibonacciCounter
        case doubleCounter
        case counterBinding
        
        // MARK: - Properties
        
        public var title: String {
            switch self {
            case .counter:
                "Counter"
            case .fibonacciCounter:
                "Fibonacci Counter"
            case .doubleCounter:
                "Double Counter"
            case .counterBinding:
                "Counter Binding"
            }
        }
    }
    
    // MARK: - Intermediate
    
    /// An enumeration that contains Intermediate
    public enum Intermediate: String, CaseIterable {
        
        // MARK: - Cases
        
        case interactiveList
        
        // MARK: - Properties
        
        public var title: String {
            switch self {
            case .interactiveList:
                "Interactive List"
            }
        }
    }
    
    // MARK: - Properties
    
    public var counters = Counters.allCases
    
    public var intermediate = Intermediate.allCases
    
    // MARK: - Children
    
    /// Instance `CounterState`
    public var counter = CounterState()
    
    /// Instance `FibonacciCounterState`
    public var fibonacciCounter = FibonacciCounterState()
    
    /// Instance `DoubleCounterState`
    public var doubleCounter = DoubleCounterState()
    
    /// Instance `CounterBindingState`
    public var counterBinding = CounterBindingState()
    
    /// Instance `InteractiveListState`
    public var interactiveList = InteractiveListState()
    
    // MARK: - Navigation
    
    /// Marks that the `Counter` is active, that is, on appear
    public var isCounterActive = false
    
    /// Marks that the `FibonacciCounter` is active, that is, on appear
    public var isFibonacciCounterActive = false
    
    /// Marks that the `DoubleCounter` is active, that is, on appear
    public var isDoubleCounterActive = false
    
    /// Marks that the `CounterBinding` is active, that is, on appear
    public var isCounterBindingActive = false
    
    /// Marks that the `InteractiveList` is active, that is, on appear
    public var isInteractiveListActive = false
}
