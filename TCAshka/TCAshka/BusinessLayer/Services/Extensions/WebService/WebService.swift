//
//  Extension.swift
//  Network
//
//  Created by Stanislav on 20.10.2023.
//

import Foundation
import ServiceCore
import HTTPTransport
import Codex

// MARK: - WebService

extension WebService {
    
    /// Request to obtain data using a key
    /// - Parameters:
    ///   - request: ready-to-use requesy
    ///   - key: necessary key to access data
    /// - Returns: serviceCall T type
    public func serviceCall<T: Decodable>(request: HTTPRequest, key: String) -> ServiceCall<T> {
        createCall {
            let response = self.transport.send(request: request)
            switch response {
            case .success(let response):
                let dictionary = try response.getJSONDictionary()?[key]
                let data = try JSONSerialization.data(withJSONObject: dictionary as Any)
                let result = try data.decoded() as T
                return .success(result)
            case .failure(error: let error):
                return .failure(error)
            }
        }
    }
    
    /// Request to obtain data
    /// - Parameter request: ready-to-use requesy
    /// - Returns: serviceCall T type
    func serviceCall<T: Decodable>(request: HTTPRequest) -> ServiceCall<T> {
        createCall {
            let response = self.transport.send(request: request)
            switch response {
            case .success(let response):
                let data = response.body.unsafelyUnwrapped
                let result = try data.decoded() as T
                return .success(result)
            case .failure(let error):
                return .failure(error)
            }
        }
    }
}
