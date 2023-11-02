# RCKit
RCKit is a simple tool kit to add basic RevenueCat support to your Vapor server.

It currently only supports the [V1 API](https://www.revenuecat.com/reference/subscribers) for getting or creating a subscriber and webhooks.

PRs welcome :)

#### Config

```swift
import RCKit

public func configure(_ app: Application) throws {
  app.revenueCat.configuration = .init(token: "<Your RevenueCat Token>")
}

```

#### Get or Create Subscriber

```swift

struct YourEntitlements: Content {
    let pro: RCEntitlement?
}

let subscriber: RCSubscriber<YourEntitlements> = try await req.application.revenueCat.getSubscriber("<userID>")
...

```

#### Webhook

```swift
func post(_ req: Request) async throws -> HTTPStatus {
  let eventBody: RCEventBody = try req.content.decode(RCEventBody.self)
  ...
}
```
