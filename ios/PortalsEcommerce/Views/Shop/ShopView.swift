import SwiftUI
import IonicPortals

struct ShopView: View {
  @ObservedObject var shop: ShopService = .shared
  @ObservedObject var viewModel = ShopViewModel()
  
  var body: some View {
    ScrollView(.vertical) {
      VStack(alignment: .leading) {
        if viewModel.shouldShowPortal {
          PortalView(portal: viewModel.portal)
            .frame(maxWidth: .infinity)
            .frame(height: 400)
        } else {
          Text("Applying Live Update...")
            .frame(maxWidth: .infinity)
            .frame(height: 400)
        }
        Text("Products")
          .font(.title2)
          .padding(.horizontal)
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 170))], spacing: 20) {
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
