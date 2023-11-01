//
//  RevenueCatClient+Application.swift
//  
//
//  Created by Andrew Farquharson on 7/09/21.
//

import Vapor

public extension Application {
    var revenueCat: RevenueCat {
        .init(application: self)
    }

    struct RevenueCat {
        let application: Application

        struct ConfigurationKey: StorageKey {
            typealias Value = RevenueCatConfiguration
        }

        public var configuration: RevenueCatConfiguration? {
            get {
                self.application.storage[ConfigurationKey.self]
            }
            nonmutating set {
                self.application.storage[ConfigurationKey.self] = newValue
            }
        }

        private var client: RevenueCatClient {
            guard let configuration = self.configuration else {
                fatalError("RevenueCatClient not configured. Use app.revenuecat.configuration = ...")
            }
            return .init(configuration: configuration, client: application.client)
        }
    }
}

// MARK: - RevenueCat

public extension Application.RevenueCat {
    func getSubscriber<E: Content>(_ revenueCatID: String) async throws -> RCSubscriber<E> {
        return try await client.getSubscriber(revenueCatID)
    }
}
