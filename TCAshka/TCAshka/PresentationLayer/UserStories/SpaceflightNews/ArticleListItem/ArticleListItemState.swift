//
//  ArticleListItemState.swift
//  TCAshka
//
//  Created by Stanislav on 08.11.2023.
//

import Foundation

// MARK: - ArticleListItemState

public struct ArticleListItemState: Identifiable, Equatable {
    
    // MARK: - Properties
    
    /// Unique identifier for the article
    public let id: Int
    
    /// The title of the article
    public let title: String
    
    /// The URL of the image associated with the article
    public let imageURL: URL
    
    /// The date and time when the article was published
    public let publicationDate: Date
    
    /// Average time to read an article
    public let readingTime: TimeInterval
    
    /// Describes the loader state
    public var isLoader = false
    
    // MARK: - Initiziler
    
    public init(article: ArticlePlainObject) {
        self.id = article.id
        self.title = article.title
        self.imageURL = article.imageURL
        self.publicationDate = article.publishedAt
        self.readingTime = article.readingTime
    }
}
