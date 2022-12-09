import SwiftUI

struct Checkout: View {
  private let checkoutTapped: () -> ()
  private let total: Int
  
  init(total: Int, checkoutTapped: @escaping () -> ()) {
    self.checkoutTapped = checkoutTapped
    self.total = total
  }
  
  var body: some View {
    VStack {
      Rectangle()
        .frame(maxWidth: .infinity)
        .frame(height: 1)
        .foregroundColor(.init(UIColor.systemGray2.cgColor))
        .padding(.bottom, 24)
      VStack(spacing: 8) {
        HStack {
          Text("Subtotal")
          Spacer()
          Text(PriceFormatter.format(fromNumber: total))
        }
        .font(.callout)
        .foregroundColor(.secondary)
        HStack {
          Text("Shipping")
          Spacer()
          Text("Standard - Free")
        }
        .font(.callout)
        .foregroundColor(.secondary)
        HStack {
          Text("Estimated total")
          Spacer()
          Text("\(PriceFormatter.format(fromNumber: total)) + Tax")
        }
        .font(.headline)
      }
      .padding(.bottom, 24)
      Button(action: checkoutTapped) {
        Text("Checkout")
          .font(.system(size: 15))
          .frame(maxWidth: .infinity)
          .frame(height: 50)
          .foregroundColor(.white)
          .background(Color.accentColor)
          .cornerRadius(8)
      }
    }
  }
}

struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
      Checkout(total: 219) {}
        .padding([.leading, .trailing], 16)
    }
}
