//
//  TimeInterval.swift
//  Network
//
//  Created by Stanislav on 24.10.2023.
//

import Foundation

// MARK: - TimeInterval

extension TimeInterval {
    
    /// Converts double format seconds to string representation
    /// - Returns: string representation
    public func string() -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string(from: self) ?? "Error"
    }
}
