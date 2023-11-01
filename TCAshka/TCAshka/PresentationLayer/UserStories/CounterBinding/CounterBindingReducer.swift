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
            case .setTextValue(let text):
                state.text = text
            case .setToggleValue(let enable):
                state.toggleEnabled = enable
                state.sliderValue = 0
                state.counter = state.counter == nil ? CounterState(count: 13) : nil
            case .moveSlider(let value):
                state.sliderValue = Double(Int(value))
            case .resetControls:
                state = CounterBindingState()
            case .counter(.decrementButtonTapped):
                print("Count: \(state.counter!.count)")
                print("Int slider value: \(Int(state.sliderValue))")
                state.sliderValue = Double(min(state.counter!.count, Int(state.sliderValue)))
                print(state.sliderValue)
            case .counter(.incrementButtonTapped):
                print("Count: \(state.counter!.count)")
                print("Int slider value: \(Int(state.sliderValue))")
                state.sliderValue = Double(min(state.counter!.count, Int(state.sliderValue)))
                print(state.sliderValue)
            case .setPickerValue(let value):
                state.pickedColor = value
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
