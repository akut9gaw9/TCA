//
//  CounterBindingFile.swift
//  TCAshka
//
//  Created by Stanislav on 31.10.2023.
//

import SwiftUI
import ComposableArchitecture

// MARK: - CounterBindingView

struct CounterBindingView: View {
    
    // MARK: - Properties
    
    /// The store powering the `CounterBinding` feature
    public var store: StoreOf<CounterBindingReducer>
    
    // MARK: - View
    
    var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section {
                    Picker(
                        "",
                        selection: viewStore.binding(
                            get: \.pickedColor,
                            send: CounterBindingAction.setPickerValue)
                    ) {
                        ForEach(viewStore.colors, id: \.self) {
                            Text($0.rawValue.capitalized).tag($0.color)
                        }
                    }
                    .pickerStyle(.segmented)
                    .disabled(viewStore.isToggleInactive)
                    Toggle(isOn: viewStore.binding(
                        get: \.isToggleInactive,
                        send: CounterBindingAction.setToggleValue
                    ), label: {
                        Text("Disable other controls")
                    })
                    .toggleStyle(SwitchToggleStyle(tint: viewStore.pickedColor.color))
                    IfLetStore(
                        store.scope(
                            state: \.counter,
                            action: CounterBindingAction.counter
                        )
                    ) { store in
                        HStack(spacing: 8) {
                            Text("\(viewStore.counterDescription)")
                            Spacer()
                            CounterView(store: store)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    } else: {
                        Text("\(viewStore.counterDescription)")
                    }
                    HStack(spacing: 8) {
                        Text("Slider value: \(Int(viewStore.sliderValue))")
                        Spacer()
                        Slider(
                            value: viewStore.binding(
                                get: \.sliderValue,
                                send: CounterBindingAction.moveSlider
                            ),
                            in: 0...Double(viewStore.maxSliderLenght),
                            step: 1
                        )
                        .disabled(viewStore.isSliderDisabled)
                    }
                }
                .accentColor(viewStore.pickedColor.color)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    CounterBindingView(
        store: Store(
            initialState: CounterBindingState(),
            reducer: CounterBindingReducer()
        )
    )
}
