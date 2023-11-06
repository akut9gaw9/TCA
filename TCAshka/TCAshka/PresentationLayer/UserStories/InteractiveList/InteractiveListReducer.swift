//
//  InteractiveListReducer.swift
//  TCAshka
//
//  Created by Stanislav on 04.11.2023.
//

import Foundation
import ComposableArchitecture

// MARK: - InteractiveListReducer

public struct InteractiveListReducer: Reducer {
    
    // MARK: - IDs
    
    private struct ItemCheckingID: Hashable {}
    
    // MARK: - Reducer
    
    public var body: some Reducer<InteractiveListState, InteractiveListAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .send(.creatingItems)
            case .creatingItems:
                let randomItems = InteractiveListItemState.randomListItems().sorted { $0.title < $1.title }
                state.items = IdentifiedArray(uniqueElements: randomItems)
            case .addRandom:
                let randomElement = InteractiveListItemState.createItem()
                state.items.insert(randomElement, at: 0)
                state.items.sorted { $0.title < $1.title }
            case .removeCheckedItems:
                state.items.removeAll(where: \.isChecked)
            case .delete(let offset):
                state.items.remove(atOffsets: offset)
            case .item(id: _, action: .checkBoxToggle):
                return .send(.removeCheckedItems)
                    .debounce(
                        id: ItemCheckingID(),
                        for: 1,
                        scheduler: DispatchQueue.main.animation()
                    )
            }
            return .none
        }
        .forEach(\.items, action: /InteractiveListAction.item) {
            InteractiveListItemReducer()
        }
    }
}
