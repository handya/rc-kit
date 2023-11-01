//
//  RCEvent.swift
//  
//
//  Created by Andrew Farquharson on 29/05/21.
//

import Foundation

struct RCEvent {
    let id: String
    let aliases: [String]?
    let appUserId: String?
    let currency: String?
    let entitlementId: String? // Deprecated. See entitlement_ids.
    let entitlementIds: [String]?
    let environment: RCEnvironment
    let eventTimestamp: Date
    let expirationAt: Date?
    let isFamilyShare: Bool?
    let originalAppUserId: String?
    let originalTransactionId: String?
    let periodType: RCPeriodType?
    let presentedOfferingId: String?
    let price: Double?
    let priceInPurchasedCurrency: Double?
    let productId: String?
    let purchasedAt: Date
    let store: RCStore
    let takehomePercentage: Float?
    let transactionId: String?
    let type: RCEventType
    let cancelReason: RCCancelReason?
}

extension RCEvent: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case aliases
        case appUserId = "app_user_id"
        case currency
        case entitlementId = "entitlement_id"
        case entitlementIds = "entitlement_ids"
        case environment
        case eventTimestamp = "event_timestamp_ms"
        case expirationAt = "expiration_at_ms"
        case isFamilyShare = "is_family_share"
        case originalAppUserId = "original_app_user_id"
        case originalTransactionId = "original_transaction_id"
        case periodType = "period_type"
        case presentedOfferingId = "presented_offering_id"
        case price
        case priceInPurchasedCurrency = "price_in_purchased_currency"
        case productId = "product_id"
        case purchasedAt = "purchased_at_ms"
        case store
        case takehomePercentage = "takehome_percentage"
        case transactionId = "transaction_id"
        case type
        case cancelReason = "cancel_reason"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.aliases = try container.decodeIfPresent([String].self, forKey: .aliases)
        self.appUserId = try container.decodeIfPresent(String.self, forKey: .appUserId)
        self.currency = try container.decodeIfPresent(String.self, forKey: .currency)
        self.entitlementId = try container.decodeIfPresent(String.self, forKey: .entitlementId)
        self.entitlementIds = try container.decodeIfPresent([String].self, forKey: .entitlementIds)
        self.environment = try container.decode(RCEnvironment.self, forKey: .environment)
        self.eventTimestamp = Date(timeIntervalSince1970: try container.decode(TimeInterval.self, forKey: .eventTimestamp) / 1000)
        if let expirationAtInterval =  try container.decodeIfPresent(TimeInterval.self, forKey: .expirationAt) {
            self.expirationAt = Date(timeIntervalSince1970: expirationAtInterval / 1000)
        } else {
            self.expirationAt = nil
        }
        self.isFamilyShare = try container.decodeIfPresent(Bool.self, forKey: .isFamilyShare)
        self.originalAppUserId = try container.decodeIfPresent(String.self, forKey: .originalAppUserId)
        self.originalTransactionId = try container.decodeIfPresent(String.self, forKey: .originalTransactionId)
        self.periodType = try container.decodeIfPresent(RCPeriodType.self, forKey: .periodType)
        self.presentedOfferingId = try container.decodeIfPresent(String.self, forKey: .presentedOfferingId)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.priceInPurchasedCurrency = try container.decodeIfPresent(Double.self, forKey: .priceInPurchasedCurrency)
        self.productId = try container.decodeIfPresent(String.self, forKey: .productId)
        self.purchasedAt = Date(timeIntervalSince1970: try container.decode(TimeInterval.self, forKey: .purchasedAt) / 1000)
        self.store = try container.decode(RCStore.self, forKey: .store)
        self.takehomePercentage = try container.decodeIfPresent(Float.self, forKey: .takehomePercentage)
        self.transactionId = try container.decodeIfPresent(String.self, forKey: .transactionId)
        self.type = try container.decode(RCEventType.self, forKey: .type)
        self.cancelReason = try container.decodeIfPresent(RCCancelReason.self, forKey: .cancelReason)
    }
}
