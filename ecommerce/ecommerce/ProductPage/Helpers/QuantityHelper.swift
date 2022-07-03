//
//  QuantityHelper.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/30/22.
//

import SwiftUI

struct QuantityHelper: View {
    @EnvironmentObject var cartManager: CartManager
    
    var product: NewProduct
    
    var body: some View {
        HStack {
            Button {
                cartManager.remoteFromCart(product: product)
            } label: {
                Image(systemName: "minus")
            }
            .frame(width: 50)
            Text("1")
                .bold()
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
            }
            .frame(width: 50)
        }
    }
}

struct QuantityHelper_Previews: PreviewProvider {
    static var previews: some View {
        QuantityHelper(product: products[0])
            .environmentObject(CartManager())
    }
}
