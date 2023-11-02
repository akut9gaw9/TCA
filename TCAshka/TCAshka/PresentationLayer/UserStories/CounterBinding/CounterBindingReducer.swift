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
                state.isToggleActive = enable
                state.isSliderDisabled = enable
            case .setToggleCounterValue:
                state.counter = state.counter == nil ? CounterState(count: 13) : nil
            case .setSliderValue(let value):
                state.sliderValue = value
            case .setPickerValue(let value):
                state.pickedColor = value
            case .counter(.decrementButtonTapped), .counter(.incrementButtonTapped):
                if state.isToggleActive { return .none }    
                let isCounterZero = state.counter?.count == 0
                state.isSliderDisabled = isCounterZero
                state.counter?.isMinusButtonDisabled = isCounterZero
                state.counter?.isResetButtonDisabled = isCounterZero
                state.sliderValue = min(state.sliderValue, state.maxSliderLenght)
            case .counter(.resetButtonTapped):
                state.counter?.isMinusButtonDisabled = true
                state.counter?.isResetButtonDisabled = true
                state.sliderValue = state.sliderValue > state.maxSliderLenght ? state.maxSliderLenght : state.sliderValue
            }
            return .none
        }
        .ifLet(\.counter, action: /CounterBindingAction.counter) {
            CounterReducer()
        }
    }
    
}
