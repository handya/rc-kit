//
//  RCPeriodType.swift
//  
//
//  Created by Andrew Farquharson on 29/05/21.
//

import Foundation

public enum RCPeriodType: String {
    case unknown
    case trial = "TRIAL"
    case intro = "INTRO"
    case normal = "NORMAL"
    case promotional = "PROMOTIONAL"
}

// MARK: - Decodable

extension RCPeriodType: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = RCPeriodType(rawValue: rawValue) ?? .unknown
    }
}
