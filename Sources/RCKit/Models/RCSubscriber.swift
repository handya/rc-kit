//
//  RCSubscriber.swift
//  
//
//  Created by Andrew Farquharson on 7/09/21.
//

import Vapor

public struct RCSubscriber<E: Content>: Content {
    public let entitlements: E
    public let firstSeen: Date?
    public let lastSeen: Date?
    public let managementUrl: String?
    public let originalAppUserId: String?
    public let originalApplicationVersion: String?
    public let originalPurchaseDate: Date?

    enum CodingKeys: String, CodingKey {
        case entitlements
        case firstSeen = "first_seen"
        case lastSeen = "last_seen"
        case managementUrl = "management_url"
        case originalAppUserId = "original_app_user_id"
        case originalApplicationVersion = "original_application_version"
        case originalPurchaseDate = "original_purchase_date"
    }
}
