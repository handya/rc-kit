//
//  RCCancelReason.swift
//  
//
//  Created by Andrew Farquharson on 29/05/21.
//

import Foundation

public enum RCCancelReason: String {
    case unknown
    case unsubscribe = "UNSUBSCRIBE"
    case billingError = "BILLING_ERROR"
    case developerInitiated = "DEVELOPER_INITIATED"
    case priceIncrease = "PRICE_INCREASE"
    case customerSupport = "CUSTOMER_SUPPORT"
}

// MARK: - Decodable

extension RCCancelReason: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = RCCancelReason(rawValue: rawValue) ?? .unknown
    }
}
