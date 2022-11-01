import Foundation
import Combine

class Cart: ObservableObject {
  struct Item {
    var product: Product
    var quantity: UInt
  }
  
  private(set) var id: Int = Int.random(in: 100...1000)
  @Published private(set) var contents: [Item] = []
  
  var subTotal: Int {
    return contents.reduce(0) { $0 + ($1.product.price * Int($1.quantity)) }
  }
  
  func add(product: Product, quantity: UInt) {
    let index = contents.firstIndex { item in
        item.product == product
    }
    if let index = index {
        update(product: product, quantity: quantity + contents[index].quantity)
    }
    else {
        update(product: product, quantity: quantity)
    }
  }
  
  func update(product: Product, quantity: UInt) {
    let existingIndex = contents.firstIndex { item in
        item.product == product
    }
    guard let index = existingIndex else {
        if quantity > 0 {
            contents.append(Item(product: product, quantity: quantity))
        }
        return
    }
    if quantity > 0 {
        contents[index].quantity = quantity
    }
    else {
        contents.remove(at: index)
    }
  }
  
  func clear() {
    contents = []
  }
  
}

extension Cart: Encodable {
  enum CodingKeys: String, CodingKey {
    case id, subTotal, basket
  }
  enum BasketKeys: String, CodingKey {
    case productId, quantity
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(subTotal, forKey: .subTotal)
    
    var cartContents = container.nestedUnkeyedContainer(forKey: .basket)
    for item in contents {
      var basketItem = cartContents.nestedContainer(keyedBy: BasketKeys.self)
      try basketItem.encode(item.product.id, forKey: .productId)
      try basketItem.encode(item.quantity, forKey: .quantity)
    }
  }
}
