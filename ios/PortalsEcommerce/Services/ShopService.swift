import SwiftUI

class ShopService: ObservableObject {
  @Published var products: [Product] = []
  @Published var user: User?
  @Published var cart = Cart()
  @Published var count = 0
  
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
  
  func addToCart(product: Product) {
    self.cart.add(product: product, quantity: 1)
    getCount()
  }
  
  func updateQuantity(product: Product, quantity: UInt) {
    self.cart.update(product: product, quantity: quantity)
    getCount()
  }
  
  func clearCart() {
    self.cart.clear()
    getCount()
  }
  
  private func getCount() {
    count = self.cart.contents.reduce(0) { $0 + Int($1.quantity) }
  }

}
