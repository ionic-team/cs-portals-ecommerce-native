import UIKit


enum ProductCategory: String, Codable {
    case mustHaves = "MustHaves"
    case featured = "Featured"
    case onSale = "Sale"
    case recommended = "Recommended"
    
    var title: String {
        switch self {
        case .mustHaves:
            return "Must Haves, Bestsellers & More"
        default:
            return "Products"
        }
    }
}

struct Product: Codable, Equatable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id, title, description, price, category
        case imageName = "image"
    }
    
    var id: Int
    var title: String
    var description: String
    var price: Int
    var imageName: String
    var category: ProductCategory
}
