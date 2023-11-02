//
//  RCEntitlement.swift
//  
//
//  Created by Andrew Farquharson on 7/09/21.
//

import Vapor

public struct RCEntitlement: Content {
    public let expiresAt: Date
    public let gracePeriodExpiresAt: Date?
    public let productIdentifier: String
    public let purchasedAt: Date

    enum CodingKeys: String, CodingKey {
        case expiresAt = "expires_date"
        case gracePeriodExpiresAt = "grace_period_expires_date"
        case productIdentifier = "product_identifier"
        case purchasedAt = "purchase_date"
    }
}
