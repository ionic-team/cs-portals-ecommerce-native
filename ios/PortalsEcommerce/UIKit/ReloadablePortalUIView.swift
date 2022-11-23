import SwiftUI
import Combine
import IonicPortals
import IonicLiveUpdates

/**
 * WARNING!
 *
 * Ionic recommends applying Live Updates in the default background mode.
 * Manual syncing is implemented solely for ** DEMO PURPOSES **.
 */

struct ReloadablePortalUIView: UIViewRepresentable {
  
  @Binding var shouldReload: Bool
  var portal: Portal
  
  func makeUIView(context: Context) -> PortalUIView {
    return PortalUIView(portal: portal)
  }
  
  func updateUIView(_ portal: PortalUIView, context: Context) {
    if shouldReload {
      portal.reload()
    }
  }
}

struct ReloadablePortal: View {
  private let portal: Portal
  private let syncTopic = Topics.syncLiveUpdate.rawValue
  
  @State private var shouldShowPortal = true
  @State private var shouldReload = false
  
  init(portal: Portal) {
    self.portal = portal
  }
  
  private func syncAndReloadPortal() {
    guard let appId = Portal.featured.liveUpdateConfig?.appId else {
      print("Define Live Update configuration for this Portal.")
      return
    }
    shouldShowPortal = false
    LiveUpdateManager.shared.sync(appId: appId) { result in
      DispatchQueue.main.async {
        switch result {
        case .failure(let error):
          print("Sync failed with error: \(error)")
          shouldShowPortal = true
        case .success:
          shouldReload = true
          shouldShowPortal = true
        }
      }
    }
  }
  
  var body: some View {
    VStack {
      if shouldShowPortal {
        ReloadablePortalUIView(shouldReload: $shouldReload, portal: .featured)
          .onReceive(
            PortalsPubSub.publisher(for: syncTopic)
              .receive(on: DispatchQueue.main)
          ) { _ in
            syncAndReloadPortal()
          }
      } else {
        Text("Applying Live Update...")
      }
    }
    .frame(maxWidth: .infinity)
    .frame(height: 400)
  }
}

struct ReloadablePortal_Previews: PreviewProvider {
  static var previews: some View {
    ReloadablePortal(portal: .user)
  }
}
