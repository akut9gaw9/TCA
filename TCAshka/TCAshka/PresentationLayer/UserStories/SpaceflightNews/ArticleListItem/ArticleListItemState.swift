//
//  ArticleListItemState.swift
//  TCAshka
//
//  Created by Stanislav on 08.11.2023.
//

import Foundation

// MARK: - ArticleListItemState

public struct ArticleListItemState: Identifiable, Equatable {
    
    // MARK: - Initiziler
    
    public init(article: ArticlePlainObject) {
        self.id = UUID()
        self.title = article.title
        self.imageURL = article.imageURL
        self.publishedAt = article.publishedAt
    }
    
    // MARK: - Properties
    
    /// Unique identifier for the article
    public let id: UUID
    
    /// The title of the article
    public let title: String
    
    /// The URL of the image associated with the article
    public let imageURL: URL
    
    /// The date and time when the article was published
    public let publishedAt: Date
    
    /// Average time to read an article
    public var readingTime: String {
        TimeInterval(5 * 3600 + 12 * 60 + 59).string()
    }
}
