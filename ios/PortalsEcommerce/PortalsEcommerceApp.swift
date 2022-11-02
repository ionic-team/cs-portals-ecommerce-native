import SwiftUI

@main
struct PortalsEcommerceApp: App {
  @StateObject var tabRouter = TabsRouter()
  @StateObject var shopService = ShopService()
  
  init() {
    //if let portalsApiKey = Bundle.main.infoDictionary?["PORTALS_API_KEY"] as? String {
      //print(portalsApiKey)
    //}
  }
    
  var body: some Scene {
    WindowGroup {
      TabsView()
        .environmentObject(tabRouter)
        .environmentObject(shopService)
    }
  }
}
