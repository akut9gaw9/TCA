//
//  TCAshkaApp.swift
//  TCAshka
//
//  Created by Stanislav on 26.10.2023.
//

import SwiftUI
import TCA
@main

// MARK: - Application

struct TCAshkaApp: App {
    
    // MARK: - Scene
    
    public var body: some Scene {
        WindowGroup {
            CounterView(store: StoreOf<CounterFeature>(initialState: CounterState(), reducer: CounterFeature()))
        }
    }
}
