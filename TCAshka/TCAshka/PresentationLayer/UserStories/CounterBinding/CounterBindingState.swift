//
//  CounterBindingState.swift
//  TCAshka
//
//  Created by Stanislav on 31.10.2023.
//

import Foundation
import SwiftUI

// MARK: - CounterBindingState

public struct CounterBindingState: Equatable {
    
    // MARK: - Properties
    
    public var counterDescription: String {
        return "Counter is \(counter == nil ? "off" : "on")"
    }
    
    public var colors = PickableColor.allCases
    
    public var pickedColor = PickableColor.red
    
    public var toggleEnabled = false
    
    public var sliderValue = 0.0
    
    public var text = ""
    
    // MARK: - Children
    
    /// Optional `CounterState` instance
    public var counter: CounterState? = CounterState(count: 13)
    
    // MARK: - PickableColor
    
    public enum PickableColor: String, CaseIterable {
        
        // MARK: - Cases
        
        case red
        case green
        case blue
        case orange
        case purple
        
        // MARK: - Properties
        
        public var color: Color {
            switch self {
            case .red:
                return .red
            case .green:
                return .green
            case .blue:
                return .blue
            case .orange:
                return .orange
            case .purple:
                return .purple
            }
        }
    }
}
