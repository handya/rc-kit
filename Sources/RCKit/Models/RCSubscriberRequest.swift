//
//  RCSubscriberRequest.swift
//  
//
//  Created by Andrew Farquharson on 7/09/21.
//

import Vapor

public struct RCSubscriberRequest<E: Content>: Content {
    public let subscriber: RCSubscriber<E>
}
