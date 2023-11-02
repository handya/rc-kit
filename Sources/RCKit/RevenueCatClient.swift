//
//  RevenueCatClient.swift
//  
//
//  Created by Andrew Farquharson on 7/09/21.
//

import Vapor

public class RevenueCatClient {

    // MARK: - Properties

    private let configuration: RevenueCatConfiguration

    private let client: Client

    // MARK: - Init

    init(configuration: RevenueCatConfiguration, client: Client) {
        self.configuration = configuration
        self.client = client
    }

    // MARK: - Functions

    private func headers() -> HTTPHeaders {
        var result: HTTPHeaders = .init()
        result.add(name: "Authorization", value: "Bearer " + configuration.token)
        result.add(name: .contentType, value: "application/json")
        result.add(name: .accept, value: "application/json")
        return result
    }

    func getSubscriber<E: Content>(_ revenueCatID: String) async throws -> RCSubscriber<E> {
        let urlString: String = "https://api.revenuecat.com/v1/subscribers/\(revenueCatID)"
        return try await client.get(URI(string: urlString)) { req in
            req.headers = self.headers()
        }
        .flatMapThrowing { res -> RCSubscriberRequest in
            do {
                return try res.content.decode(RCSubscriberRequest.self)
            } catch let error {
                throw error
            }
        }
        .map(\.subscriber)
        .get()
    }
}
