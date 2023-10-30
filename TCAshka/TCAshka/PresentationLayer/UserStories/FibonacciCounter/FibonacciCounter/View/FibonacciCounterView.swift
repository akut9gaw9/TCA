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
        WithViewStore(store, observe: {$0}) { viewStore in
            VStack(spacing: 30) {
                Text("Номер числа в последовательности: \(viewStore.count)")
                ZStack {
                    Rectangle()
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .foregroundColor(.white)
                    HStack {
                        HStack {
                            Spacer()
                            Button {
                                viewStore.send(.incrementButtonTapped)
                            } label: {
                                Image(systemName: "minus")
                                    .foregroundColor(viewStore.isButtonOff ? .gray : .black)
                            }
                            .disabled(viewStore.isButtonOff)
                            Spacer()
                        }
                        Rectangle()
                            .frame(width: 1, height: 18)
                            .foregroundColor(.gray)
                        Text("\(viewStore.number)")
                            .foregroundColor(.black)
                        Rectangle()
                            .frame(width: 1, height: 18)
                            .foregroundColor(.gray)
                            .cornerRadius(1)
                        HStack {
                            Spacer()
                            Button {
                                viewStore.send(.decrementButtonTapped)
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(viewStore.isPlusButtonOff ? .gray : .black)
                            }
                            .disabled(viewStore.isPlusButtonOff)
                            Spacer()
                        }
                    }
                }
                .frame(maxWidth: 130, maxHeight: 33)
                Button("Reset") {
                    viewStore.send(.resetButtonTapped)
                }
                .disabled(viewStore.isButtonOff)
            }
            .font(.system(size: 17, design: .rounded))
        }
    }
}

//#Preview {
//    FibonacciCounterView(store: Store(initialState: FibonacciCounterState(), reducer: FibonacciCounterReducer()))
//}

