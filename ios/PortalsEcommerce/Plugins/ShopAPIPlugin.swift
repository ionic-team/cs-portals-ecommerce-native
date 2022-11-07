import SwiftUI
import Capacitor

@objc(ShopAPI)
public class ShopAPIPlugin: CAPPlugin {
  private lazy var encoder = JSONEncoder()
  private lazy var decoder = JSONDecoder()
  
  public override func load() {
    print("HELLO")
  }
  
  @objc func getCart(_ call: CAPPluginCall) {
    call.resolve(["data": "Hi"])
  }
  
  @objc func getUserDetails(_ call: CAPPluginCall) {
    print("E: GetUserDetails Called")
    guard let user = try? encoder.encodeJSObject(ShopService.shared.user) as? JSObject else {
      return call.reject("User unavailable!")
    }
    call.resolve(user)
  }
  
  @objc func updateUserDetails(_ call: CAPPluginCall) {
    call.resolve()
  }
  
  @objc func checkoutResult(_ call: CAPPluginCall) {
    call.resolve()
  }
  
  @objc func getUserPicture(_ call: CAPPluginCall) {
    call.resolve()
  }
  
  @objc func setUserPicture(_ call: CAPPluginCall) {
    call.resolve()
  }
}
