//
//  Badge.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/20/22.
//

import SwiftUI

struct Badge: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        if (cartManager.items.count > 0) {
            ZStack {
                Circle()
                    .fill(.red)
                    .frame(width: 20, height: 20)
                Text(String(cartManager.items.count))
                    .font(.caption)
                    .foregroundColor(Color.white)
            }
        } else {
            EmptyView()
        }
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
