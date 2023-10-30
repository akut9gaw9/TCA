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
    
    public var store: StoreOf<DoubleCounterReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: 30) {
                VStack {
                    Text("Counter #1: \(viewStore.counter1.sequence)")
                    CounterView(
                        store: store.scope(
                            state: \.counter1,
                            action: DoubleCounterAction.counter1
                        )
                    )
                }
                VStack {
                    Text("Counter #2: \(viewStore.counter2.sequence)")
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

#Preview {
    DoubleCounterView(store: Store(initialState: DoubleCounterState(), reducer: {
        DoubleCounterReducer()
    }))
}
