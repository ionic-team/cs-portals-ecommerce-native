import SwiftUI

struct ContentView: View {
  @EnvironmentObject var router: TabsRouter
  
  var body: some View {
    TabView(selection: $router.currentTab) {
      NavigationView {
        ShopView().navigationTitle("Shop")
      }
      .tag(Tab.shop)
      .tabItem { Label("Shop", systemImage: "list.dash")}
      .navigationViewStyle(StackNavigationViewStyle())
      NavigationView {
        CartView().navigationTitle("Shop")
      }
      .tag(Tab.cart)
      .tabItem { Label("Cart", systemImage: "list.dash")}
      .navigationViewStyle(StackNavigationViewStyle())
      NavigationView {
        ProfileView().navigationTitle("Shop")
      }
      .tag(Tab.profile)
      .tabItem { Label("Profile", systemImage: "list.dash")}
      .navigationViewStyle(StackNavigationViewStyle())
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(TabsRouter())
    }
}
