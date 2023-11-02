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
    
    // MARK: - PickableColor
    
    /// An enumeration that contains colors
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
    
    // MARK: - Properties
    
    /// Variable storing colors from `PickableColor`
    public var colors = PickableColor.allCases
    
    /// Selected color
    public var pickedColor = PickableColor.red
    
    /// Activity or inactivity toggle
    public var isToggleActive = false
    
    public var isCounterActive = false
    
    /// Activity or inactivity toggle counter
    public var isToggleCounterActive = false
    
    /// Slider value
    public var sliderValue = 0.0
    
    /// Max slider lenght
    public var maxSliderLenght: Double {
        Double(max(1, counter?.count ?? -1))
    }
    
    /// Variable to disable the slider
    public var isSliderDisabled = false
        
    // MARK: - Children
    
    /// Optional `CounterState` instance
    public var counter: CounterState? = CounterState(count: 13)
}

// MARK: - Text

extension CounterBindingState {
    
    /// Describes the state of the counter
    public var counterDescription: String {
        return "Counter is \(counter == nil ? "off" : "on")"
    }
}
