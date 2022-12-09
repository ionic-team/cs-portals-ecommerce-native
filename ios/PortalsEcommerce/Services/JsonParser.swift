import Foundation

struct JsonData: Codable {
  let products: [Product]
  let user: User
}

class JsonParser {
  static func parseLocalFile(forName name: String) -> JsonData? {
    do {
      if let bundlePath = Bundle.main.path(forResource: name, ofType: "json") {
        let data = try String(contentsOfFile: bundlePath).data(using: .utf8)
        return try JSONDecoder().decode(JsonData.self, from: data!)
      }
    } catch {
      print(error)
    }
    return nil
  }
}
