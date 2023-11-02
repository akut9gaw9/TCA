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
            ModuleCounterView(
                store: Store(
                    initialState: ModuleCounterState(),
                    reducer: ModuleCounterReducer()
                )
            )
        }
    }
}
