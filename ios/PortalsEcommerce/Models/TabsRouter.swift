import Foundation

enum Tab: Hashable {
  case shop
  case cart
  case profile
}

class TabsRouter: ObservableObject {
  @Published var currentTab: Tab = .shop
}
