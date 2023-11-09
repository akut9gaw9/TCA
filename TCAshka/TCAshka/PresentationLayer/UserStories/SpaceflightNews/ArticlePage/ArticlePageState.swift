//
//  ArticlePageState.swift
//  TCAshka
//
//  Created by Stanislav on 09.11.2023.
//

import Foundation

// MARK: - ArticlePageState

public struct ArticlePageState: Equatable {
    
    // MARK: - Properties
    
    /// Unique identifier for the article
    public var id: Int
    
    /// The title of the article
    public var title: String
    
    /// The URL of the image associated with the article
    public var imageURL: URL?
    
    /// The date and time when the article was published
    public var publicationDate: Date
    
    /// Average time to read an article
    public var readingTime: TimeInterval
    
    /// Imitation of a large article description
    public var summary: String
    
    /// Author of the article
    public var author: String
    
    // MARK: - Initialization
    
    public init(id: Int) {
        self.id = id
        self.title = ""
        self.imageURL = nil
        self.publicationDate = Date()
        self.readingTime = 0
        self.summary = ""
        self.author = ""
    }
    
    public init(article: ArticlePlainObject) {
        self.id = article.id
        self.title = article.title
        self.imageURL = article.imageURL
        self.publicationDate = article.publishedAt
        self.readingTime = article.readingTime
        self.summary = article.summary
        self.author = article.author
    }
}
