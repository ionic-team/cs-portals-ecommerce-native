import SwiftUI
import IonicPortals

extension Cart.Item: Identifiable {
  var id: Int { product.id }
}

struct CartView: View {
  @ObservedObject var shop: ShopService = .shared
  @State var shouldDisplayCheckout = false
  let dismissTopic = Topics.dismissModal.rawValue

  func deleteProducts(for indexSet: IndexSet) {
    indexSet.compactMap { shop.cart.contents[safe: $0]?.product }
      .forEach { product in shop.updateQuantity(product: product, quantity: 0) }
  }
  
  var body: some View {
    if shop.cart.contents.isEmpty {
      Text("Your cart is empty").font(.title)
    } else {
      List {
        ForEach(shop.cart.contents) { item in
          ProductListItem(
            product: item.product,
            quantity: item.quantity,
            onSelectQuantity: { quantity in
              shop.updateQuantity(product: item.product, quantity: quantity)
            }
          )
          .listRowSeparator(.hidden)
        }
        .onDelete(perform: self.deleteProducts)
        Checkout(total: shop.cart.subTotal) {
          self.shouldDisplayCheckout = true
        }
        .listSectionSeparator(.hidden)
        .buttonStyle(.plain)
        .padding(.top, 16)
      }
      .listStyle(.plain)
      .sheet(isPresented: $shouldDisplayCheckout) {
        PortalView(portal: .checkout)
          .onReceive(
            PortalsPubSub.publisher(for: dismissTopic)
              .receive(on: DispatchQueue.main)
          ) {
            _ in self.shouldDisplayCheckout = false
          }
      }
    }
  }
}

struct CartView_Previews: PreviewProvider {
  static var previews: some View {
    CartView().environmentObject(ShopService())
  }
}
