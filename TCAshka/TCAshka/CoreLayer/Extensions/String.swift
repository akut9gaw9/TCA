//
//  String.swift
//  TCAshka
//
//  Created by Stanislav on 07.11.2023.
//

import Foundation

// MARK: - String

extension String {
    
    /// Capitalized first letter in string
    /// - Returns: string whis capitalized first letter
    public var capitalizingFirstLetter: String {
        prefix(1).uppercased() + dropFirst()
    }
}
