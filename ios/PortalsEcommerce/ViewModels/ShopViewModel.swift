import SwiftUI
import IonicPortals
import IonicLiveUpdates
import Combine

class ShopViewModel: ObservableObject {
  private var syncLiveUpdateCancellable: AnyCancellable?
  
  let portal =  Portal(
    name: "featuredproductsapp",
    startDir: "portals/featured",
    liveUpdateConfig: LiveUpdate(
      appId: "a7b10ac1",
      channel: "native",
      syncOnAdd: false
    )
  )
  
  @Published var shouldShowPortal = true
  
  init() {
    syncLiveUpdateCancellable = PortalsPubSub.publisher(for: Topics.syncLiveUpdate.rawValue)
      .data(as: String.self)
      .receive(on: DispatchQueue.main)
      .sink { _ in self.syncLiveUpdate() }
  }
  
  deinit {
    syncLiveUpdateCancellable = nil
  }
  
  func syncLiveUpdate() {
    print("func syncLiveUpdate hit")
    shouldShowPortal = false
    //TODO: Refresh portal
  }
  
}
