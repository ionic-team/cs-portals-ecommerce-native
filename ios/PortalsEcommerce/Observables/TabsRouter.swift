//
//  TabsRouter.swift
//  PortalsEcommerce
//
//  Created by Eric Horodyski on 10/28/22.
//

import Foundation

enum Tab: Hashable {
  case shop
  case cart
  case profile
}

class TabsRouter: ObservableObject {
  @Published var currentTab: Tab = .shop
}
