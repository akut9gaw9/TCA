//
//  CounterView.swift
//  TCAshka
//
//  Created by Stanislav on 27.10.2023.
//

import SwiftUI
import ComposableArchitecture

// MARK: - CounterView

public struct CounterView: View {
    
    // MARK: - Properties
    
    /// The store powering the `ExplorerTutorialDetailed` feature
    public let store: StoreOf<CounterReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack(spacing: 18) {
                HStack(alignment: .center, spacing: 8) {
                    Button {
                        viewStore.send(.incrementButtonTapped)
                    } label: {
                        Image(systemName: "minus")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.textForeground)
                    }
                    .disabled(viewStore.isMinusButtonDisabled)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    Text("\(viewStore.count)")
                        .foregroundColor(.textForeground)
                    Button {
                        viewStore.send(.decrementButtonTapped)
                    } label: {
                        Image(systemName: "plus")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.textForeground)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .background(
                    RoundedRectangle(
                        cornerRadius: 25.0,
                        style: .continuous
                    )
                .foregroundColor(.fontStandart))
                .frame(maxWidth: 120, maxHeight: 33)
                Button(action: {
                    viewStore.send(.resetButtonTapped)
                }, label: {
                    Text("Reset")
                        .foregroundColor(.fontStandart)
                })
            }
            .font(.system(size: 17, design: .rounded))
        }
    }
}

// MARK: - Preview

#Preview {
    CounterView(
        store: Store(
            initialState: CounterState(),
            reducer: CounterReducer()
        )
    )
}
