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
            FibonacciCounterView(
                store: Store(
                    initialState: FibonacciCounterState(),
                    reducer: FibonacciCounterReducer()
                )
            )
        }
    }
}
