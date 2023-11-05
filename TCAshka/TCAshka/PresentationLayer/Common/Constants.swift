//
//  Constants.swift
//  TCAshka
//
//  Created by Stanislav on 05.11.2023.
//

import SwiftUI

// MARK: - Constants

public enum Constants {
    
    // MARK: - Item
    
    public enum Item: CaseIterable {
        
        // MARK: - Title
        
        public enum ItemTitle: CustomStringConvertible, CaseIterable {
            
            // MARK: - Cases
            
            case andrew
            case dmitry
            case gleb
            case roma
            case stas
            
            // MARK: - Properties
            
            public var description: String {
                switch self {
                case .andrew:
                    "Andrew"
                case .dmitry:
                    "Dmitry"
                case .gleb:
                    "Gleb"
                case .roma:
                    "Roma"
                case .stas:
                    "Stas"
                }
            }
            
            // MARK: - Useful
            
            public var randomElement: String {
                Constants.Item.ItemTitle.allCases.randomElement()!.description
            }
        }
        
        // MARK: - Color
        
        public enum ItemColor: CaseIterable {
            
            // MARK: - Cases
            
            case red
            case blue
            case purple
            case pink
            
            // MARK: - Properties
            
            public var color: Color {
                switch self {
                case .red:
                    .red
                case .blue:
                    .blue
                case .purple:
                    .purple
                case .pink:
                    .pink
                }
            }
            
            // MARK: - Useful
            
            public var randomElement: ItemColor {
                Constants.Item.ItemColor.allCases.randomElement()!
            }
        }
        
        // MARK: - Image
        
        public enum ItemImage: CaseIterable {
            
            // MARK: - Cases
            
            case heart
            case cross
            case microbe
            case facemask
            
            // MARK: - Properties
            
            var image: Image {
                switch self {
                case .heart:
                    Image(systemName: "heart.fill")
                case .cross:
                    Image(systemName: "cross.case.fill")
                case .microbe:
                    Image(systemName: "microbe.circle.fill")
                case .facemask:
                    Image(systemName: "facemask.fill")
                }
            }
            
            // MARK: - Useful
            
            public var randomElement: ItemImage {
                Constants.Item.ItemImage.allCases.randomElement()!
            }
        }
    }
}

private let item = Constants.Item.ItemTitle.allCases.randomElement()
