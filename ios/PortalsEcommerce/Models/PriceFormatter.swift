import Foundation

class PriceFormatter {
  
  static let noFractionCurrency: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 0
    return formatter
  }()
  
  static func format(fromNumber: Int) -> String {
    return PriceFormatter.noFractionCurrency.string(from: fromNumber as NSNumber) ?? "$0"
  }
}
