//
//  ProductComments.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/11/22.
//

import SwiftUI

struct ProductComments: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var services: Services
    
    @State var showNextView = false
    
    var product: NewProduct
    
    var body: some View {
        VStack {
            NavigationLink(destination:
                            CommentsPageSVC(product: product)
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
                           , isActive: $showNextView) {
                EmptyView()
            }
            Button {
                showNextView = true
            } label: {
                Text("Comments")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .border(Color.accentColor)
                    .foregroundColor(Color.white)
            }
            .padding()
            .background(Color.accentColor)
        }
    }
}

//struct ProductComments_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductComments(product: NewProduct(id: 12, name: "", category: "", new: false, price: "", featured: false, cartIMG: "", productIMG: "", description: "", features: "", contents: [], previews: [], recommended: []))
//    }
//}
