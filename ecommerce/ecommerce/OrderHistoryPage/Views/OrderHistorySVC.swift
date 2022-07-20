//
//  OrderHistorySVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/8/22.
//

import SwiftUI

struct OrderHistorySVC: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var services: Services

    var body: some View {
        VStack(alignment: .leading) {
            NavigationBar()
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
                .navigationTitle("")
                .navigationBarHidden(true)
            SignupModal()
            Text("Order History")
                .font(.title2)
                .bold()
                .padding(.horizontal)
                .padding(.top)
            OrderHistoryList()
                .environmentObject(ordersManager)
                .padding(.horizontal)
            Spacer()
        }
    }
}


