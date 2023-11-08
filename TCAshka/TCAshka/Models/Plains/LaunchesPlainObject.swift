//
//  LauchesPlainObject.swift
//  Network
//
//  Created by Stanislav on 19.10.2023.
//

import Foundation

// MARK: - LauchesPlainObject

public struct LaunchesPlainObject: Decodable, Equatable {
    
    // MARK: - Properties
    
    /// The unique identifier for the launch
    public let launchID: String
    
    /// The provider or company responsible for the launch
    public let provider: String
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case launchID = "launch_id"
        case provider = "provider"
    }
}
