//
//  QuantityHelper.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/30/22.
//

import SwiftUI

struct QuantityHelper: View {
    @Binding var quantity: Int
    
    var body: some View {
        HStack {
            Button {
                quantity = (quantity - 1) >= 0 ? (quantity - 1) : 0
            } label: {
                Image(systemName: "minus")
            }
            .frame(width: 50)
            Text(String(quantity))
                .bold()
            Button {
                quantity += 1
            } label: {
                Image(systemName: "plus")
            }
            .frame(width: 50)
        }
    }
}

//struct QuantityHelper_Previews: PreviewProvider {
//    static var previews: some View {
//        QuantityHelper()
//            .environmentObject(CartManager())
//    }
//}
