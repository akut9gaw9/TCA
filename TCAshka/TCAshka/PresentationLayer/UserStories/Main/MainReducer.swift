//
//  ModelCounterReducer.swift
//  TCAshka
//
//  Created by Stanislav on 02.11.2023.
//

import Foundation
import ComposableArchitecture
import HTTPTransport

// MARK: - MainReducer

public struct MainReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<MainState, MainAction> {
        Scope(state: \.counter, action: /MainAction.counter) {
            CounterReducer()
        }
        Scope(state: \.fibonacciCounter, action: /MainAction.fibonacciCounter) {
            FibonacciCounterReducer()
        }
        Scope(state: \.doubleCounter, action: /MainAction.doubleCounter) {
            DoubleCounterReducer()
        }
        Scope(state: \.counterBinding, action: /MainAction.counterBinding) {
            CounterBindingReducer()
        }
        Scope(state: \.interactiveList, action: /MainAction.interactiveList) {
            InteractiveListReducer()
        }
        Scope(state: \.articleList, action: /MainAction.articleList) {
            ArticleListReducer(spaceflightService: SpaceflightServiceImpementation(transport: HTTPTransport()))
        }
        Reduce { state, action in
            switch action {
            case .onCountersTap(let itemType):
                switch itemType {
                case .counter:
                    return .send(.setCounterActive(true))
                case .fibonacciCounter:
                    return .send(.setFibonacciCounterActive(true))
                case .doubleCounter:
                    return .send(.setDoubleCounterActive(true))
                case .counterBinding:
                    return .send(.setCounterBindingActive(true))
                }
            case .onIntermediateTap(let itemType):
                switch itemType {
                case .interactiveList:
                    return .send(.setInteractiveListActive(true))
                case .articleList:
                    return .send(.setArticleListActive(true))
                }
            case .setCounterActive(let isActive):
                state.isCounterActive = isActive
            case .setFibonacciCounterActive(let isActive):
                state.isFibonacciCounterActive = isActive
            case .setDoubleCounterActive(let isActive):
                state.isDoubleCounterActive = isActive
            case .setCounterBindingActive(let isActive):
                state.isCounterBindingActive = isActive
            case .setInteractiveListActive(let isActive):
                state.isInteractiveListActive = isActive
            case .setArticleListActive(let isActive):
                state.isArticleListActive = isActive
            default:
                break
            }
            return .none
        }
    }
}
