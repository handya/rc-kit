//
//  RCPeriodType.swift
//  
//
//  Created by Andrew Farquharson on 29/05/21.
//

import Foundation

public enum RCPeriodType: String, Decodable {
    case trial = "TRIAL"
    case intro = "INTRO"
    case normal = "NORMAL"
    case promotional = "PROMOTIONAL"
}
