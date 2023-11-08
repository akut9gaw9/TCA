//
//  ResultsPlainObject.swift
//  Network
//
//  Created by Stanislav on 19.10.2023.
//

import Foundation

// MARK: - ArticlePlainObject

public struct ArticlePlainObject: Decodable, Identifiable, Equatable {
    
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
    
    /// Average time to read an article
    public var readingTime: TimeInterval {
        5 * 3600 + 12 * 60 + 59
    }
    
    /// Author of the article
    public let author: String = "Jack Simpson"
    
    /// Imitation of a large article description
    public let content: String = """
Тут будет написано очень много текста для вида, потому что если я не проверю на объемном тексте, как у меня работают вьюшки - я буду плохой и мне отрежет палец кто-нибудь из ингибизидро. Если вы дочитали до этого предложения, значит вам не особо плевать на содержание, ну или просто стало интересно и вы решили скоротать время за прочтением этого бессмысленного материала, который отнимет у вас только время. Возможно, вы бы успели заняться чем-то полезным, но если вы до сих пор читаете это, значит глубоко надеетесь на то, что вы увидите здесь что-то полезное. Ну если дочитали до сюда - молодцы, расскажу тогда какой-нибудь интересный факт ->

Первым программистом в истории человечества была женщина. Ада Августа Лавлейс (Байрон) — дочь известного английского писателя Джоржа Гордона Байрона. Она родилась 10 декабря 1815 года в Англии. Любовь к математике девушке привила мать еще с самого детства. С ней занимались лучшие ученые в округе, где жила юная особа. Первым учителем стал выдающийся Август де Морган, считавшийся выдающимся математиком и логиком. Девушка стала настоящим гением своего времени и посвятила свою жизнь науке.
"""
    
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
