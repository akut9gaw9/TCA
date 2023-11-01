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
            VStack(spacing: 30) {
                HStack(spacing: 8) {
                    HStack(spacing: 8) {
                        Spacer()
                        Button {
                            viewStore.send(.incrementButtonTapped)
                        } label: {
                            Image(systemName: "minus")
                                .foregroundColor(.textForeground)
                        }
                        Spacer()
                    }
                    Rectangle()
                        .frame(width: 1, height: 18)
                        .foregroundColor(.gray)
                    Text("\(viewStore.count)")
                        .foregroundColor(.textForeground)
                    Rectangle()
                        .frame(width: 1, height: 18)
                        .foregroundColor(.gray)
                        .cornerRadius(1)
                    HStack(spacing: 8) {
                        Spacer()
                        Button {
                            viewStore.send(.decrementButtonTapped)
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.textForeground)
                        }
                        Spacer()
                    }
                }
                .background(RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                    .foregroundColor(.fontStandart))
                .frame(maxWidth: 130, maxHeight: 33)
//                Button("Reset") {
//                    viewStore.send(.resetButtonTapped)
//                }
//                .disabled(viewStore.isResetButtonDisabled)
//                .foregroundColor(.fontStandart)
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
