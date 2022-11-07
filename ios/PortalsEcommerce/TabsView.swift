import SwiftUI

struct TabsView: View {
  @EnvironmentObject var router: TabsRouter

  var body: some View {
    TabView(selection: $router.currentTab) {
      NavigationView {
        ShopView().navigationTitle("Shop")
      }
      .tag(Tab.shop)
      .tabItem { Image("tab-shop-icon").renderingMode(.template)}
      .navigationViewStyle(StackNavigationViewStyle())
      NavigationView {
        CartView().navigationTitle("Cart")
      }
      .tag(Tab.cart)
      .tabItem { Image("tab-cart-icon").renderingMode(.template)}
      .navigationViewStyle(StackNavigationViewStyle())
      ProfileView()
      .tag(Tab.profile)
      .tabItem { Image("tab-profile-icon").renderingMode(.template)}
      .navigationViewStyle(StackNavigationViewStyle())
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
        .environmentObject(TabsRouter())
        .environmentObject(ShopService())
    }
}
