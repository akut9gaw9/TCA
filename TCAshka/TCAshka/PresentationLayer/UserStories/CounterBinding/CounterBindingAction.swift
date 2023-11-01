//
//  CounterBindingAction.swift
//  TCAshka
//
//  Created by Stanislav on 31.10.2023.
//

import Foundation

// MARK: - CounterBindingAction

public enum CounterBindingAction: Equatable {
    
    // MARK: - Properties
    
    case resetControls
    
    // MARK: - Binding
    
    case setPickerValue(CounterBindingState.PickableColor)
    
    case setTextValue(String)
    
    case setToggleValue(Bool)
        
    case moveSlider(Double)
    
    // MARK: - Children
    
    case counter(CounterAction)
    
}
