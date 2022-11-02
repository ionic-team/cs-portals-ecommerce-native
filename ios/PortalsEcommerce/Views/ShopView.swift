//
//  ShopView.swift
//  PortalsEcommerce
//
//  Created by Eric Horodyski on 10/28/22.
//

import SwiftUI

struct ShopView: View {
  @EnvironmentObject var shop: ShopService
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        ForEach(shop.products, id: \.self) { product in
          Text(product.title)
          Text(product.description)
        }.padding(10)
      }
    }

  }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
      ShopView().environmentObject(ShopService())
    }
}
