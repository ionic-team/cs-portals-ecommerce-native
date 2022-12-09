import SwiftUI

struct ProductListItem: View {
  private let product: Product
  private let quantity: UInt
  private let onSelectQuantity: (UInt) -> Void
  
  init(product: Product, quantity: UInt, onSelectQuantity: @escaping (UInt) -> Void) {
    self.product = product
    self.quantity = quantity
    self.onSelectQuantity = onSelectQuantity
  }
  
  var body: some View {
    HStack(spacing: 16) {
      Image(product.imageName)
        .resizable()
        .frame(width: 108, height: 108, alignment: .center)
        .cornerRadius(12)
      VStack(alignment: .leading, spacing: 4) {
        Text(product.title).font(.title2)
        HStack {
          Menu {
            Picker(
              "Choose a quantity",
              selection: Binding<UInt>(
                get: { quantity },
                set: { onSelectQuantity($0) }
              )
            ) {
              ForEach(Range<UInt>(uncheckedBounds: (1, 10)), id: \.self) {
                Text("\($0)")
              }
            }
          } label: {
            HStack(spacing: 1) {
              Text("Qty \(quantity)")
              Image("quantity-dropdown-icon")
            }
            .font(.callout.monospacedDigit())
            .foregroundColor(.secondary)
          }
          Spacer()
          if let price = product.price {
            Text(PriceFormatter.format(fromNumber: price))
          }
        }
        .font(.callout)
        .foregroundColor(.secondary)
      }
    }
  }
}

struct ProductListItem_Previews: PreviewProvider {
  static let product = Product(
    id: 1,
    title: "Capacitor Snapback",
    description: "",
    price: 32,
    imageName: "capacitor-hat",
    category: .featured
  )
  
  static var previews: some View {
    ProductListItem(product: product, quantity: 1) { _ in }
  }
}
