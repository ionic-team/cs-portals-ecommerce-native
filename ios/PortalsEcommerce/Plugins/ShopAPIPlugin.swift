import SwiftUI
import Capacitor

@objc(ShopAPI)
public class ShopAPIPlugin: CAPPlugin {
  private lazy var encoder = JSONEncoder()
  private lazy var decoder = JSONDecoder()
  
  @objc func getCart(_ call: CAPPluginCall) {
    let cart = ShopService.shared.cart
    guard let cartJSON = try? encoder.encodeJSObject(cart) as? JSObject else {
      return call.reject("Cart unavailable!")
    }
    call.resolve(cartJSON)
  }
  
  @objc func getUserDetails(_ call: CAPPluginCall) {
    let user = ShopService.shared.user
    guard let userJSON = try? encoder.encodeJSObject(user) as? JSObject else {
      return call.reject("User unavailable!")
    }
    call.resolve(userJSON)
  }
  
  @objc func updateUserDetails(_ call: CAPPluginCall) {
    let userJSON = call.jsObjectRepresentation
    guard let user = try? decoder.decodeJSObject(User.self, from: userJSON) else {
      return call.reject("Invalid user details!")
    }
    ShopService.shared.updateUser(user: user)
    call.resolve()
  }
  
  @objc func checkoutResult(_ call: CAPPluginCall) {
    guard let status = CheckoutStatus(rawValue: call.getString("result", "")) else {
      return call.reject("Missing checkout result!")
    }
    if status == .completed {
      ShopService.shared.cart.clear()
    }
    call.resolve()
  }
  
  @objc func getUserPicture(_ call: CAPPluginCall) {
    if let user = ShopService.shared.user {
      call.resolve(["picture": user.imageName])
    } else {
      call.reject("User picture unavailable!")
    }
  }
  
  @objc func setUserPicture(_ call: CAPPluginCall) {
    call.resolve()
  }
}
