import Foundation
import IonicPortals
import IonicLiveUpdates

extension Portal {
  static let featured = Self(
    name: "featured",
    startDir: "portals/featuredproductsapp",
    liveUpdateConfig: LiveUpdate(
      appId: "a7b10ac1",
      channel: "native",
      syncOnAdd: false
    )
  )
  
  static let user = Self(
    name: "user",
    startDir: "portals/shopwebapp",
    initialContext: ["startingRoute": "/user"]
  )
  
  static let help = Self(
    name: "help",
    startDir: "portals/shopwebapp",
    initialContext: ["startingRoute": "/help"]
  )
}
