//
//  CounterBindingAction.swift
//  TCAshka
//
//  Created by Stanislav on 31.10.2023.
//

import Foundation

// MARK: - CounterBindingAction

public enum CounterBindingAction: Equatable {
    
    // MARK: - Binding
    
    /// Case which sets the selected color
    case setPickerValue(CounterBindingState.PickableColor)
        
    /// The case that makes toggle active or inactive
    case setToggleValue(Bool)
    
    /// The case that makes toggle counter active or inactive
    case setToggleCounterValue(Bool)
        
    /// A case that reacts to changes in the slider value
    case setSliderValue(Double)
    
    // MARK: - Children
    
    /// Handling events using a child action `CounterAction`
    case counter(CounterAction)
}
