//
//  InteractiveListItemView.swift
//  TCAshka
//
//  Created by Stanislav on 04.11.2023.
//

import SwiftUI
import ComposableArchitecture

// MARK: - InteractiveListItemView

public struct InteractiveListItemView: View {
    
    // MARK: - Properties
    
    /// The store powering the `InteractiveListItem` feature
    public var store: StoreOf<InteractiveListItemReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack(spacing: 5) {
                Circle()
                    .fill(viewStore.color)
                    .frame(width: 29, height: 29)
                Text(viewStore.title)
                    Spacer()
                viewStore.image
                    .renderingMode(.original)
                Button {
                    viewStore.send(.checkBoxToggle)
                    let impact = UISelectionFeedbackGenerator()
                    impact.selectionChanged()
                } label: {
                    Image(systemName: viewStore.isChecked ? "checkmark.square" : "square")
                }
                .buttonStyle(PlainButtonStyle())
            }
            .foregroundColor(viewStore.isChecked ? .gray : nil)
            .frame(height: 40)
        }
    }
}

