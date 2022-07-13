//
//  QuantityHelper.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/30/22.
//

import SwiftUI

struct QuantityHelper: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "minus")
            }
            .frame(width: 50)
            Text("1")
                .bold()
            Button {
                
            } label: {
                Image(systemName: "plus")
            }
            .frame(width: 50)
        }
    }
}

struct QuantityHelper_Previews: PreviewProvider {
    static var previews: some View {
        QuantityHelper()
    }
}
