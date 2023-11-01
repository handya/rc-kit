//
//  RCEventBody.swift
//  
//
//  Created by Andrew Farquharson on 29/05/21.
//

import Foundation

public struct RCEventBody: Decodable {
    public let version: String
    public let event: RCEvent

    enum CodingKeys: String, CodingKey {
        case version = "api_version"
        case event
    }
}
