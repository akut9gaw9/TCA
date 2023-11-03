//
//  ModuleCounterView.swift
//  TCAshka
//
//  Created by Stanislav on 02.11.2023.
//

import SwiftUI
import ComposableArchitecture

// MARK: - MainView

public struct MainView: View {
    
    // MARK: - Properties
    
    public var store: StoreOf<MainReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                List {
                    Section(header: Text("Counters")) {
                        ForEach(viewStore.counters, id: \.self) { counterType in
                            Button {
                                viewStore.send(.onItemTap(counterType))
                            } label: {
                                Text(counterType.title)
                                    .foregroundColor(.listText)
                            }
                        }
                    }
                }
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isCounterActive,
                            send: MainAction.setCounterActive
                        ),
                        destination: {
                            CounterView(
                                store: store.scope(
                                    state: \.counter,
                                    action: MainAction.counter
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
                            send: MainAction.setFibonacciCounterActive
                        ),
                        destination: {
                            FibonacciCounterView(
                                store: store.scope(
                                    state: \.fibonacciCounter,
                                    action: MainAction.fibonacciCounter
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
                            send: MainAction.setDoubleCounterActive
                        ),
                        destination: {
                            DoubleCounterView(
                                store: store.scope(
                                    state: \.doubleCounter,
                                    action: MainAction.doubleCounter
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
                            send: MainAction.setCounterBindingActive
                        ),
                        destination: {
                            CounterBindingView(
                                store: store.scope(
                                    state: \.counterBinding,
                                    action: MainAction.counterBinding
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
    MainView(
        store: Store(
            initialState: MainState(),
            reducer: MainReducer()
        )
    )
}
