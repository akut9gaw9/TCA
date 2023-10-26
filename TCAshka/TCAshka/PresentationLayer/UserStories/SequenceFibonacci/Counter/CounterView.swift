//
//  ContentView.swift
//  TCAshka
//
//  Created by Stanislav on 26.10.2023.
//

import SwiftUI
import TCA

// MARK: - CounterView

public struct CounterView: View {
    
    // MARK: - Properties
    
    public let store: StoreOf<CounterFeature>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
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
                                    .foregroundColor(.black)
                            }.disabled(viewStore.state.count == 0)
                            Spacer()
                        }
                        Rectangle()
                            .frame(width: 1, height: 18)
                            .foregroundColor(.gray)
                        Text("\(viewStore.number)")
                            .font(.system(size: 17, design: .rounded))
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
                                    .foregroundColor(.black)
                            }
                            Spacer()
                        }
                    }
                }.frame(maxWidth: 130, maxHeight: 33)
                Button("Reset") {
                    viewStore.send(.resetButtonTapped)
                }.disabled(viewStore.state.number == 0)
            }
        }
    }
}

#Preview {
    CounterView(store: Store(initialState: CounterState(), reducer: CounterFeature()))
}

