//
//  ProductFeatures.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/30/22.
//

import SwiftUI

struct ProductFeatures: View {
    var product: NewProduct
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("FEATURES")
                .font(.title2)
                .bold()
            Text(product.features)
        }
    }
}

struct ProductFeatures_Previews: PreviewProvider {
    static var previews: some View {
        ProductFeatures(product: products[0])
    }
}
