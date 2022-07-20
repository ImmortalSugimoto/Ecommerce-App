//
//  NavigationBar.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/30/22.
//

import SwiftUI

struct NavigationBar: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var services: Services

    var body: some View {
        HStack {
            NavigationLink(destination:
                            AccountPageSVC().navigationTitle("").navigationBarHidden(true)
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
            ) {
                Image(systemName: "gear")
                    .foregroundColor(Color.white)
            }
            Spacer()
            Text("Pick'n'Pay")
                .foregroundColor(.white)
                .font(.title)
                .bold()
            Spacer()
            NavigationLink(destination:
                            ShoppingCartSVC()
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services))
            {
                Image(systemName: "cart")
                    .foregroundColor(Color.white)
            }
        }
        .padding([.leading, .trailing], 27)
        .padding([.top, .bottom], 20)
        .background(Color.black)
    }
}
