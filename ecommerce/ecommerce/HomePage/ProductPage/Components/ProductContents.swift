//
//  ProductContents.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/30/22.
//

import SwiftUI

struct ProductContents: View {
    var product: NewProduct
    let columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("IN THE BOX")
                .font(.title2)
                .bold()
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0..<product.contents.count) { index in
                        ItemHelper(quantity: product.contents[index].quantity, item: product.contents[index].item)
                    }
                }
            }
        }
    }
}

struct ProductContents_Previews: PreviewProvider {
    static var previews: some View {
        ProductContents(product: products[0])
    }
}
