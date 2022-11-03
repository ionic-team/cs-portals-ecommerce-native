import SwiftUI

struct ShopView: View {
  private let columns = [GridItem(.adaptive(minimum: 170))]
  
  @ObservedObject var shop: ShopService = .shared
  
  var body: some View {
    ScrollView(.vertical) {
      VStack(alignment: .leading) {
        Text("Products")
          .font(.title2)
          .padding(.horizontal)
        LazyVGrid(columns: columns, spacing: 20) {
          ForEach(shop.products, id: \.self) { product in
            NavigationLink(destination: ItemDetailView(product: product)) {
              ProductTile(product: product)
            }
            .buttonStyle(PlainButtonStyle())
          }
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
      ShopView().environmentObject(ShopService())
    }
}
