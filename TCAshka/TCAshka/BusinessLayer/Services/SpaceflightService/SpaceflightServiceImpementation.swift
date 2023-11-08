//
//  SpaceflightServiceImpementation.swift
//  Network
//
//  Created by Stanislav on 17.10.2023.
//

import ServiceCore
import HTTPTransport
import Codex


// MARK: - SpaceflightServiceImpementation

public final class SpaceflightServiceImpementation: WebService {
    
    // MARK: - Initilizer
    
    public init(transport: HTTPTransport) {
        super.init(
            baseURL: AppConstants.Network.apiURL,
            transport: transport
        )
    }
}

// MARK: - SpaceflightService

extension SpaceflightServiceImpementation: SpaceflightService {
    
    public func obtainArticles(hasEvent: Bool, hasLaunch: Bool) -> ServiceCall<[ArticlePlainObject]> {
        let queryArguments = self.fillHTTPRequestParameters(
            self.urlParameters,
            with: [
                "has_event": hasEvent,
                "has_launch": hasLaunch,
            ]
        )
        let request = HTTPRequest(
            httpMethod: .get,
            endpoint: "/articles",
            parameters: [queryArguments],
            base: self.baseRequest
        )
        return serviceCall(request: request, key: "results")
    }
    
    public func obtainArticle(id: Int) -> ServiceCall<ArticlePlainObject> {
        let request = HTTPRequest(
            httpMethod: .get,
            endpoint: "/articles/\(id)",
            base: self.baseRequest
        )
        return serviceCall(request: request)
    }
    
    public func obtainBlogs() -> ServiceCall<[BlogPlainObject]> {
        let request = HTTPRequest(
            httpMethod: .get,
            endpoint: "/blogs",
            base: self.baseRequest
        )
        return serviceCall(request: request, key: "results")
    }
    
    public func obtainInfo() -> ServiceCall<[String]> {
        let request = HTTPRequest(
            httpMethod: .get,
            endpoint: "/info",
            base: self.baseRequest
        )
        return serviceCall(request: request, key: "news_sites")
    }
}
