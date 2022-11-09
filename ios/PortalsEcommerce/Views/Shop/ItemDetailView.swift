import SwiftUI

struct ItemDetailView: View {
  let product: Product
  @ObservedObject var shop: ShopService = .shared
  
  var body: some View {
    VStack {
      Image(product.imageName)
        .resizable()
        .scaledToFit()
      Spacer()
      VStack(alignment: .leading, spacing: 0) {
        Text(product.title)
          .font(.title)
        Text(PriceFormatter.format(fromNumber: product.price))
          .font(.subheadline)
          .foregroundColor(.secondary)
          .padding(EdgeInsets(top: 5, leading: 0, bottom: 20, trailing: 0))
        Text(product.description)
          .font(.subheadline)
        Button {
          ShopService.shared.addToCart(product: product)
        } label: {
            Text("Add to cart")
              .font(.subheadline)
              .frame(maxWidth: .infinity)
              .padding(.vertical, 8)
        }
        .buttonStyle(.borderedProminent)
        .padding(.vertical)
      }
      .padding(.horizontal)
    }
    .navigationBarTitle(Text(product.title), displayMode: .inline)
    .toolbar(content: {
      ToolbarItem(placement: .navigationBarTrailing) {
        NavigationLink(destination: HelpView()) {
          Image("toolbar-help-icon")
        }.navigationTitle("")
      }
    })
  }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
      ItemDetailView(
        product: Product(
          id: 1,
          title: "Capacitor Snapback",
          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
          price: 32,
          imageName: "capacitor-hat",
          category: .featured)
      ).environmentObject(ShopService())
    }
}
