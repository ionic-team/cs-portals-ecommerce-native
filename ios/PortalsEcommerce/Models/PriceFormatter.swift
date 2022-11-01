import Foundation

class PriceFormatter {
  
  static let noFractionCurrency: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 0
    return formatter
  }()
  
  static func format(fromNumber: NSNumber) -> String {
    return noFractionCurrency.string(from: fromNumber) ?? "$0"
  }
}
