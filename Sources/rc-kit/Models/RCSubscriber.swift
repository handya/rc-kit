//
//  RCSubscriber.swift
//  
//
//  Created by Andrew Farquharson on 7/09/21.
//

import Vapor

struct RCSubscriber<E: Content>: Content {
    let entitlements: E
    let firstSeen: Date?
    let lastSeen: Date?
    let managementUrl: String?
    let originalAppUserId: String?
    let originalApplicationVersion: String?
    let originalPurchaseDate: Date?

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
