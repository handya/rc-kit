//
//  RCStore.swift
//  
//
//  Created by Andrew Farquharson on 29/05/21.
//

import Foundation

public enum RCStore: String, Decodable {
    case playStore = "PLAY_STORE"
    case appStore = "APP_STORE"
    case stripe = "STRIPE"
    case macAppStore = "MAC_APP_STORE"
    case promotional = "PROMOTIONAL"
}
