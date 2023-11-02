//
//  ModuleCounterView.swift
//  TCAshka
//
//  Created by Stanislav on 02.11.2023.
//

import SwiftUI
import ComposableArchitecture

// MARK: - ModuleCounterView

public struct ModuleCounterView: View {
    
    // MARK: - Properties
    
    public var store: StoreOf<ModuleCounterReducer>
    
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                List {
                    Section(header: Text("Counters")) {
                        Button(action: {
                            viewStore.send(.setCounterActive(true))
                        }, label: {
                            Text("Counter")
                                .foregroundColor(.listText)
                        })
                        Button(action: {
                            viewStore.send(.setFibonacciCounterActive(true))
                        }, label: {
                            Text("FibonacciCounter")
                                .foregroundColor(.listText)
                        })
                        Button(action: {
                            viewStore.send(.setDoubleCounterActive(true))
                        }, label: {
                            Text("DoubleCounter")
                                .foregroundColor(.listText)
                        })
                        Button(action: {
                            viewStore.send(.setCounterBindingActive(true))
                        }, label: {
                            Text("CounterBinding")
                                .foregroundColor(.listText)
                        })
                    }
                }
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isCounterActive,
                            send: ModuleCounterAction.setCounterActive
                        ),
                        destination: {
                            CounterView(
                                store: store.scope(
                                    state: \.counter,
                                    action: ModuleCounterAction.counterAction
                                )
                            )
                        },
                        label: {
                            EmptyView()
                        }
                    )
                )
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isFibonacciCounterActive,
                            send: ModuleCounterAction.setFibonacciCounterActive
                        ),
                        destination: {
                            FibonacciCounterView(
                                store: store.scope(
                                    state: \.fibonacciCounter,
                                    action: ModuleCounterAction.fibonacciCounterAction
                                )
                            )
                        },
                        label: {
                            EmptyView()
                        }
                    )
                )
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isDoubleCounterActive,
                            send: ModuleCounterAction.setDoubleCounterActive
                        ),
                        destination: {
                            DoubleCounterView(
                                store: store.scope(
                                    state: \.doubleCounter,
                                    action: ModuleCounterAction.doubleCounterAction
                                )
                            )
                        },
                        label: {
                            EmptyView()
                        }
                    )
                )
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isCounterBindingActive,
                            send: ModuleCounterAction.setCounterBindingActive
                        ),
                        destination: {
                            CounterBindingView(
                                store: store.scope(
                                    state: \.counterBinding,
                                    action: ModuleCounterAction.counterBinding
                                )
                            )
                        },
                        label: {
                            EmptyView()
                        }
                    )
                )
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ModuleCounterView(
        store: Store(
            initialState: ModuleCounterState(),
            reducer: ModuleCounterReducer()
        )
    )
}
