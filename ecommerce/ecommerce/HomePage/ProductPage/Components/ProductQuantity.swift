//
//  ProductQuantity.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/30/22.
//

import SwiftUI

struct ProductQuantity: View {
    
    var body: some View {
        HStack {
            QuantityHelper()
            Spacer()
            Button(action: {
                print("Order Placed!")
            }) {
                Text("ADD TO CART")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color.red)
            }
            .foregroundColor(Color.white)
            .background(Color.red)
        }
    }
}

struct ProductQuantity_Previews: PreviewProvider {
    static var previews: some View {
        ProductQuantity()
    }
}
