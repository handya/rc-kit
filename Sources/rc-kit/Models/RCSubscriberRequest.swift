//
//  RCSubscriberRequest.swift
//  
//
//  Created by Andrew Farquharson on 7/09/21.
//

import Vapor

struct RCSubscriberRequest<E: Content>: Content {
    let subscriber: RCSubscriber<E>
}
