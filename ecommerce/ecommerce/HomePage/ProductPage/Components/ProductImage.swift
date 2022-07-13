//
//  ProductImage.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/30/22.
//

import SwiftUI

struct ProductImage: View {
    var product: NewProduct
    
    var body: some View {
        Image(product.productIMG)
            .resizable()
            .scaledToFill()
            .frame(height: 400)
            .clipped()
            .listRowInsets(EdgeInsets())
    }
}

struct ProductImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductImage(product: products[0])
    }
}
