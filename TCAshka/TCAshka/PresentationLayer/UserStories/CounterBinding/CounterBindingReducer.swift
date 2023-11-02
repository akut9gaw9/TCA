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
                state.sliderValue = 0
                state.counter = state.counter == nil ? CounterState(count: 13) : nil
            case .setSliderValue(let value):
                state.sliderValue = Double(Int(value))
            case .setPickerValue(let value):
                state.pickedColor = value
            case .counter(.decrementButtonTapped), .counter(.incrementButtonTapped):
                let isCounter = state.counter?.count == 0
                state.isSliderDisabled = isCounter
                state.counter?.isMinusButtonDisabled = isCounter
                state.sliderValue = state.sliderValue > state.maxSliderLenght ? state.maxSliderLenght : state.sliderValue
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
