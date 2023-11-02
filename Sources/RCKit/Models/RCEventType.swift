//
//  RCEventType.swift
//  
//
//  Created by Andrew Farquharson on 29/05/21.
//

import Foundation

public enum RCEventType: String {
    case unknown
    case test = "TEST"
    case expiration = "EXPIRATION"
    case initialPurchase = "INITIAL_PURCHASE"
    case nonRenewingPurchase = "NON_RENEWING_PURCHASE"
    case renewal = "RENEWAL"
    case productChange = "PRODUCT_CHANGE"
    case cancellation = "CANCELLATION"
    case uncancellation = "UNCANCELLATION"
    case billingIssue = "BILLING_ISSUE"
    case subscriberAlias = "SUBSCRIBER_ALIAS"
    case subscriptionPaused = "SUBSCRIPTION_PAUSED"
    case transfer = "TRANSFER"
}

// MARK: - Decodable

extension RCEventType: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = RCEventType(rawValue: rawValue) ?? .unknown
    }
}
