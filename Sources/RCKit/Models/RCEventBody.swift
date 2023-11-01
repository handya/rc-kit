//
//  RCEventBody.swift
//  
//
//  Created by Andrew Farquharson on 29/05/21.
//

import Foundation

struct RCEventBody: Decodable {
    let version: String
    let event: RCEvent

    enum CodingKeys: String, CodingKey {
        case version = "api_version"
        case event
    }
}
