import SwiftUI

class ShopService: ObservableObject {
  @Published var products: [Product] = []
  @Published var user: User?
  
  static var shared = ShopService()
  
  init() {
    if let data = JsonParser.parseLocalFile(forName: "data") {
      self.products = data.products.shuffled()
      self.user = data.user
    }
  }

}
