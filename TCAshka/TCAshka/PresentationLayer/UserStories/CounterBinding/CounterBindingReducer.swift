//
//  CounterBindingReducer.swift
//  TCAshka
//
//  Created by Stanislav on 31.10.2023.
//

import Foundation
import ComposableArchitecture

// MARK: -  CounterBindingReducer

public struct CounterBindingReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<CounterBindingState, CounterBindingAction> {
        Reduce { state, action in
            switch action {
            case .setToggleValue(let enable):
                state.isToggleInactive = enable
                state.isSliderDisabled = enable
                state.sliderValue = 0
                state.counter = state.counter == nil ? CounterState(count: 13) : nil
            case .moveSlider(let value):
                state.sliderValue = Double(Int(value))
            case .setPickerValue(let value):
                state.pickedColor = value
            case .counter(.decrementButtonTapped), .counter(.incrementButtonTapped):
                if state.counter?.count == 0 {
                    state.isSliderDisabled = true
                    state.counter?.isMinusButtonDisabled = true
                } else {
                    state.isSliderDisabled = false
                    state.counter?.isMinusButtonDisabled = false
                }
            default:
                return .none
            }
            return .none
        }
        .ifLet(\.counter, action: /CounterBindingAction.counter) {
            CounterReducer()
        }
    }
    
}
