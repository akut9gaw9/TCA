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
                return .send(.updateItems)
            case .updateItems:
                let randomItems = randomListItems()
                state.items = IdentifiedArray(uniqueElements: randomItems)
            case .addRandom:
                let randomElement = createItem()
                state.items.insert(randomElement, at: 0)
            case .removeCheckedItems:
                state.items.removeAll(where: \.isChecked)
            case .delete(let offset):
                state.items.remove(atOffsets: offset)
            case .item(id: _, action: .checkBoxToggle):
                return .send(.removeCheckedItems)
                    .throttle(
                        id: ItemCheckingID(),
                        for: 1,
                        scheduler: DispatchQueue.main.animation(),
                        latest: true
                    )
//                    .debounce(
//                        id: ItemCheckingID(),
//                        for: 1,
//                        scheduler: DispatchQueue.main.animation()
//                    )
            }
            return .none
        }
        .forEach(\.items, action: /InteractiveListAction.item(id:action:)) {
            InteractiveListItemReducer()
        }
    }
}
