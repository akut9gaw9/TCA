//
//  SpaceflightService.swift
//  Network
//
//  Created by Stanislav on 17.10.2023.
//

import Foundation
import ServiceCore

// MARK: - SpaceflightServiceAction

public enum SpaceflightServiceAction: Equatable {
    
    // MARK: - Cases
    
    ///
    case articleListObtained([ArticlePlainObject])
    
    ///
    case articleObtained(ArticlePlainObject)
}

// MARK: - SpaceflightServiceError

public typealias SpaceflightServiceError = NSError

// MARK: - SpaceflightService

public protocol SpaceflightService {
    
    /// Request to given articles spaceflight
    /// - Parameters:
    ///   - hasEvent: has event spaceflight
    ///   - hasLaunch: has launch spaceflight
    ///   - limit: articles limit
    /// - Returns: articles list
    func obtainArticles(hasEvent: Bool, hasLaunch: Bool) -> ServiceCall<[ArticlePlainObject]>
    
    /// Request to given articles by id
    /// - Parameter id: articles id
    /// - Returns: article
    func obtainArticle(id: Int) -> ServiceCall<ArticlePlainObject>
    
    /// Request to given blogs
    /// - Returns: array blogs
    func obtainBlogs() -> ServiceCall<[BlogPlainObject]>
    
    /// Request to given info about
    /// - Returns: array of news site names
    func obtainInfo() -> ServiceCall<[String]>
}
