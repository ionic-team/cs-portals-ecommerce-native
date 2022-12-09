import SwiftUI

struct ProductTile: View {
  private let product: Product
  
  init(product: Product) {
    self.product = product
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Image(product.imageName)
        .resizable()
        .frame(width: 157, height: 149)
        .cornerRadius(16)
      Text(product.title)
        .font(.subheadline)
        .padding(EdgeInsets(top: 5, leading: 0, bottom: 3, trailing: 0))
      Text(PriceFormatter.format(fromNumber: product.price))
        .font(.subheadline)
        .foregroundColor(.secondary)
    }
  }
}

struct ProductTile_Previews: PreviewProvider {
  static let product = Product(
    id: 1,
    title: "Capacitor Snapback",
    description: "",
    price: 32,
    imageName: "capacitor-hat",
    category: .featured
  )
  
  static var previews: some View {
    ProductTile(product: product)
  }
}
