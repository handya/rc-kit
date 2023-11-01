//
//  RCEnvironment.swift
//  
//
//  Created by Andrew Farquharson on 29/05/21.
//

import Foundation

public enum RCEnvironment: String, Decodable {
    case sandbox = "SANDBOX"
    case production = "PRODUCTION"
}
