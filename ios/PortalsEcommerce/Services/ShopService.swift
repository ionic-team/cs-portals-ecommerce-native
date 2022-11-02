import SwiftUI

class ShopService: ObservableObject {
  @Published var products: [Product] = []
  @Published var user: User?
  
  init() {
    if let data = JsonParser.parseLocalFile(forName: "data") {
      self.products = data.products
      self.user = data.user
    }
  }
}
