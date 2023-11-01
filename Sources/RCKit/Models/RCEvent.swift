//
//  RCEvent.swift
//  
//
//  Created by Andrew Farquharson on 29/05/21.
//

import Foundation

public struct RCEvent {
    public let id: String
    public let aliases: [String]?
    public let appUserId: String?
    public let currency: String?
    public let entitlementId: String? // Deprecated. See entitlement_ids.
    public let entitlementIds: [String]?
    public let environment: RCEnvironment
    public let eventTimestamp: Date
    public let expirationAt: Date?
    public let isFamilyShare: Bool?
    public let originalAppUserId: String?
    public let originalTransactionId: String?
    public let periodType: RCPeriodType?
    public let presentedOfferingId: String?
    public let price: Double?
    public let priceInPurchasedCurrency: Double?
    public let productId: String?
    public let purchasedAt: Date
    public let store: RCStore
    public let takehomePercentage: Float?
    public let transactionId: String?
    public let type: RCEventType
    public let cancelReason: RCCancelReason?
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

    public init(from decoder: Decoder) throws {
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
