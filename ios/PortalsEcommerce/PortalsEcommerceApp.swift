//
//  PortalsEcommerceApp.swift
//  PortalsEcommerce
//
//  Created by Eric Horodyski on 10/26/22.
//

import SwiftUI

@main
struct PortalsEcommerceApp: App {
  @StateObject var tabRouter = TabsRouter()
  
  init() {
    if let portalsApiKey = Bundle.main.infoDictionary?["PORTALS_API_KEY"] as? String {
      print(portalsApiKey)
    }
  }
  
    var body: some Scene {
        WindowGroup {
          ContentView().environmentObject(tabRouter)
        }
    }
}
