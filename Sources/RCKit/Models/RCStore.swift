//
//  RCStore.swift
//  
//
//  Created by Andrew Farquharson on 29/05/21.
//

import Foundation

public enum RCStore: String {
    case unknown
    case playStore = "PLAY_STORE"
    case appStore = "APP_STORE"
    case stripe = "STRIPE"
    case macAppStore = "MAC_APP_STORE"
    case promotional = "PROMOTIONAL"
}

// MARK: - Decodable

extension RCStore: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = RCStore(rawValue: rawValue) ?? .unknown
    }
}
