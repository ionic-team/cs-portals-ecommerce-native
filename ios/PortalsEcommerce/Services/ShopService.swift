import SwiftUI

class ShopService: ObservableObject {
  @Published var products: [Product] = []
  @Published var user: User?
  @Published var cart = Cart()
  
  static var shared = ShopService()
  
  init() {
    if let data = JsonParser.parseLocalFile(forName: "data") {
      self.products = data.products.shuffled()
      self.user = data.user
    }
  }
  
  func updateUser(user: User) {
    self.user = user
  }
  
  func clearCart() {
    self.cart.clear()
  }

}
