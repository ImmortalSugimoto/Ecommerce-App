//
//  ProductSVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/30/22.
//

import SwiftUI

struct ProductSVC: View {
    var product = products[0]
    let columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        VStack {
            NavigationBar()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    ProductImage(product: product)
                        .padding([.leading, .trailing], 27)
                    ProductDetails(product: product)
                        .padding([.leading, .trailing], 27)
                    ProductQuantity()
                        .padding([.leading, .trailing], 27)
                    ProductFeatures(product: product)
                        .padding([.leading, .trailing], 27)
                    ProductContents(product: product)
                        .padding([.leading, .trailing], 27)
                    ProductPreview(product: product)
                        .padding([.leading, .trailing], 27)
                    RecommendedHelper(product: product)
                    ChooseCategory()
                    About()
                    FooterHelper()
                }
            }
        }
    }
}

struct ProductSVC_Previews: PreviewProvider {
    static var previews: some View {
        ProductSVC()
    }
}
