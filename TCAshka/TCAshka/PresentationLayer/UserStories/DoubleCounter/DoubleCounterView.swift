//
//  DoubleCounterView.swift
//  TCAshka
//
//  Created by Stanislav on 27.10.2023.
//

import SwiftUI
import ComposableArchitecture

// MARK: - DoubleCounterView

public struct DoubleCounterView: View {
    
    // MARK: - Properties
    
    /// The store powering the `ExplorerTutorialDetailed` feature
    public var store: StoreOf<DoubleCounterReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack(spacing: 30) {
                VStack(spacing: 8) {
                    Text("Counter #1: \(viewStore.sequenceCounter1)")
                    CounterView(
                        store: store.scope(
                            state: \.counter1,
                            action: DoubleCounterAction.counter1
                        )
                    )
                }
                VStack(spacing: 8) {
                    Text("Counter #2: \(viewStore.sequenceCounter2)")
                    CounterView(
                        store: store.scope(
                            state: \.counter2,
                            action: DoubleCounterAction.counter2
                        )
                    )
                }
                Text("Сумма: \(viewStore.sum)")
            }
            .font(.system(size: 17))
        }
    }
}

// MARK: - Preview

#Preview {
    DoubleCounterView(
        store: Store(
            initialState: DoubleCounterState(),
            reducer: DoubleCounterReducer()
        )
    )
}
