//
//  ArticleListItemView.swift
//  TCAshka
//
//  Created by Stanislav on 08.11.2023.
//

import SwiftUI
import ComposableArchitecture
import Kingfisher

// MARK: - ArticleListItemView

public struct ArticleListItemView: View {
    
    // MARK: - Properties
    
    public let store: StoreOf<ArticleListItemReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack(spacing: 0) {
                KFImage(viewStore.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(size: LayoutConstants.imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                Spacer()
                VStack(spacing: 0) {
                    Text(viewStore.title)
                        .font(.system(size: 15, weight: .bold))
                    Spacer()
                    HStack(spacing: 0) {
                        Text(viewStore.publishedAt, style: .date)
                        Spacer()
                        Text(viewStore.readingTime)
                    }
                    .font(.system(size: 10, weight: .light))
                }
            }
        }
    }
}

// MARK: - LayoutConstants

private enum LayoutConstants {
    static let imageSize: CGSize = CGSize(width: 100, height: 80)
}