//
//  ArticlePageView.swift
//  TCAshka
//
//  Created by Stanislav on 09.11.2023.
//

import SwiftUI
import ComposableArchitecture
import HTTPTransport
import Kingfisher

// MARK: - ArticlePageView

public struct ArticlePageView: View {
    
    // MARK: - Properties
    
    public let store: StoreOf<ArticlePageReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            if viewStore.isLoader {
                ProgressView()
                    .scaleEffect(2)
                    .onAppear {
                        viewStore.send(.onAppear)
                    }
            } else {
                ScrollView {
                    KFImage(viewStore.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .padding(10)
                    Text(viewStore.title)
                        .font(.system(size: 20, weight: .bold))
                        .padding(10)
                    HStack {
                        Image(systemName: "person")
                        Text(viewStore.author)
                            .font(.system(size: 15, weight: .thin))
                        Spacer()
                        Text(viewStore.publicationDate, style: .date)
                            .font(.system(size: 15, weight: .thin))
                    }
                    .padding(12)
                    Text(viewStore.summary)
                        .font(.system(size: 15, weight: .thin))
                        .padding(12)
                }
            }
        }
    }
}

// MARK: - Preview

//#Preview {
//    ArticlePageView(
//        store: Store(
//            initialState: ArticlePageState(
//                article: <#ArticlePlainObject#>
//            ),
//            reducer: ArticlePageReducer(
//                spaceflightService: SpaceflightServiceImpementation(
//                    transport: HTTPTransport()
//                )
//            )
//        )
//    )
//}
