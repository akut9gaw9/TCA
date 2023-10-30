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
                ZStack(alignment: .center) {
                    Rectangle()
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .foregroundColor(.white)
                    HStack(spacing: 8) {
                        HStack(spacing: 8) {
                            Spacer()
                            Button {
                                viewStore.send(.incrementButtonTapped)
                            } label: {
                                Image(systemName: "minus")
                                    .foregroundColor(.black)
                            }
                            Spacer()
                        }
                        Rectangle()
                            .frame(width: 1, height: 18)
                            .foregroundColor(.gray)
                        Text("\(viewStore.count)")
                            .foregroundColor(.black)
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
                                    .foregroundColor(.black)
                            }
                            Spacer()
                        }
                    }
                }
                .frame(maxWidth: 130, maxHeight: 33)
                Button("Reset") {
                    viewStore.send(.resetButtonTapped)
                }
                .disabled(viewStore.isButtonOff)
                .foregroundColor(.black)
            }
            .font(.system(size: 17, design: .rounded))
        }
    }
}

#Preview {
    CounterView(
        store: Store(
            initialState: CounterState(),
            reducer: CounterReducer()
        )
    )
}