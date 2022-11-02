//
//  CartView.swift
//  PortalsEcommerce
//
//  Created by Eric Horodyski on 10/28/22.
//

import SwiftUI

struct CartView: View {
  @EnvironmentObject var shop: ShopService
  
  private let fixedColumns = [
    GridItem(.adaptive(minimum: 170))
  ]
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: fixedColumns, spacing: 20) {
        ForEach(shop.products, id: \.self) { product in
          VStack(alignment: .leading){
            Image(product.imageName)
              .resizable()
              .frame(width: 157, height: 149)
              .cornerRadius(16)
            Text(product.title)
              .font(.system(size: 15))
            Text(PriceFormatter.format(fromNumber: product.price))
              .font(.system(size: 14))
              .foregroundColor(.secondary)
          }
        }
      }
    }
  }
   
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
      CartView().environmentObject(ShopService())
    }
}
