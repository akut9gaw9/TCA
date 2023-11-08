//
//  BlogPlainObject.swift
//  Network
//
//  Created by Stanislav on 20.10.2023.
//

import Foundation

// MARK: - BlogPlainObject

public struct BlogPlainObject: Decodable {
    
    // MARK: - Properties
    
    /// Unique identifier for the article
    public let id: Int
    
    /// The title of the article
    public let title: String
    
    /// The URL of the article
    public let url: String
    
    /// The URL of the image associated with the article
    public let imageURL: URL
    
    /// The name of the news site where the article originated from
    public let newsSite: String
    
    /// A brief summary of the article
    public let summary: String
    
    /// The date and time when the article was published
    public let publishedAt: Date
    
    /// The date and time when the article was last updated
    public let updatedAt: Date
    
    /// Indicates whether the article is featured or not
    public let isFeatured: Bool
    
    /// An array of LaunchesPlainObject representing the launches related to the article
    public let launches: [LaunchesPlainObject]
    
    /// An array of EventsPlainObject representing the events related to the article
    public let events: [EventsPlainObject]
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case url = "url"
        case imageURL = "image_url"
        case newsSite = "news_site"
        case summary = "summary"
        case publishedAt = "published_at"
        case updatedAt = "updated_at"
        case isFeatured = "featured"
        case launches = "launches"
        case events = "events"
    }
    
    // MARK: - Initilizer
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
        self.imageURL = try container.decode(URL.self, forKey: .imageURL)
        self.newsSite = try container.decode(String.self, forKey: .newsSite)
        self.summary = try container.decode(String.self, forKey: .summary)
        self.publishedAt = try container.decode(String.self, forKey: .publishedAt).asDate() ?? Date()
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt).asDate() ?? Date()
        self.isFeatured = try container.decode(Bool.self, forKey: .isFeatured)
        self.launches = try container.decode([LaunchesPlainObject].self, forKey: .launches)
        self.events = try container.decode([EventsPlainObject].self, forKey: .events)
    }
}
