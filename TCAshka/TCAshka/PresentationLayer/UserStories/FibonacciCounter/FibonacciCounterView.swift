//
//  ContentView.swift
//  TCAshka
//
//  Created by Stanislav on 26.10.2023.
//

import SwiftUI
import ComposableArchitecture

// MARK: - FibonacciCounterView

public struct FibonacciCounterView: View {
    
    // MARK: - Properties
    
    /// The store powering the `ExplorerTutorialDetailed` feature
    public let store: StoreOf<FibonacciCounterReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack(spacing: 30) {
                Text("Число Фибоначчи: \(viewStore.number)")
                CounterView(
                    store: store.scope(
                        state: \.counter,
                        action: FibonacciCounterAction.counter
                    )
                )
            }
            .font(.system(size: 17))
        }
    }
}

#Preview {
    FibonacciCounterView(
        store: Store(
            initialState: FibonacciCounterState(),
            reducer: FibonacciCounterReducer()
        )
    )
}

