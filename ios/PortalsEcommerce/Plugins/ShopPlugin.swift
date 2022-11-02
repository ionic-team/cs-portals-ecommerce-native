import SwiftUI
import Capacitor
import Combine

@objc(ShopPlugin)
class ShopPlugin: CAPPlugin {
  //@Published var cart: Cart
  
 

  
  @objc func echo(_ call: CAPPluginCall) {
    call.resolve()
  }
}
