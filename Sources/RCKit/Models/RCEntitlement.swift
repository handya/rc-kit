//
//  RCEntitlement.swift
//  
//
//  Created by Andrew Farquharson on 7/09/21.
//

import Vapor

struct RCEntitlement: Content {
    let expiresAt: Date
    let gracePeriodExpiresAt: Date?
    let productIdentifier: String
    let purchasedAt: Date

    enum CodingKeys: String, CodingKey {
        case expiresAt = "expires_date"
        case gracePeriodExpiresAt = "grace_period_expires_date"
        case productIdentifier = "product_identifier"
        case purchasedAt = "purchase_date"
    }
}
