//
//  RevenueCatConfiguration.swift
//  
//
//  Created by Andrew Farquharson on 7/09/21.
//

import Vapor

public struct RevenueCatConfiguration: Content {
    let token: String

    public init(token: String) {
        self.token = token
    }
}
