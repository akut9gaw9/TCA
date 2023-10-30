//
//  TCAshkaApp.swift
//  TCAshka
//
//  Created by Stanislav on 26.10.2023.
//

import SwiftUI
import ComposableArchitecture
@main

// MARK: - Application

struct TCAshkaApp: App {
    
    // MARK: - Scene
    
    public var body: some Scene {
        WindowGroup {
            DoubleCounterView(store: Store(initialState: DoubleCounterState(), reducer: {
                DoubleCounterReducer()
            }))
//            FibonacciCounterView(store: Store(initialState: FibonacciCounterState(), reducer: {
//                FibonacciCounterReducer()
//            }))
        }
    }
}
