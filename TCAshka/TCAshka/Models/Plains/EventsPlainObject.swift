//
//  EventsPlainObject.swift
//  Network
//
//  Created by Stanislav on 19.10.2023.
//

import Foundation

// MARK: - EventsPlainObject

public struct EventsPlainObject: Decodable, Equatable {
    
    // MARK: - Properties
    
    /// The unique identifier for the event
    public let eventID: Int
    
    /// The provider or company responsible for the launch
    public let provider: String
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case eventID = "event_id"
        case provider = "provider"
    }
}
