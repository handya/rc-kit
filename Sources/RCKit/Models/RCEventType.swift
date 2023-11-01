//
//  RCEventType.swift
//  
//
//  Created by Andrew Farquharson on 29/05/21.
//

import Foundation

public enum RCEventType: String, Decodable, CaseIterable {
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
}
