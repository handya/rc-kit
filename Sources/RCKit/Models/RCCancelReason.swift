//
//  RCCancelReason.swift
//  
//
//  Created by Andrew Farquharson on 29/05/21.
//

import Foundation

enum RCCancelReason: String, Decodable {
    case unsubscribe = "UNSUBSCRIBE"
    case billingError = "BILLING_ERROR"
    case developerInitiated = "DEVELOPER_INITIATED"
    case priceIncrease = "PRICE_INCREASE"
    case customerSupport = "CUSTOMER_SUPPORT"
    case unknown
}
