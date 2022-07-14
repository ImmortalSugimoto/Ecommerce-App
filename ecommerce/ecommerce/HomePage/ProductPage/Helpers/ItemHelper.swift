//
//  ItemHelper.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/30/22.
//

import SwiftUI

struct ItemHelper: View {
    var quantity: Int
    var item: String
    
    var body: some View {
        HStack {
            Text("\(quantity)x")
                .bold()
            Text(item)
            Spacer()
        }
        .padding([.bottom], 1)
    }
}

struct ItemHelper_Previews: PreviewProvider {
    static var previews: some View {
        ItemHelper(quantity: 1, item: "unit")
    }
}
