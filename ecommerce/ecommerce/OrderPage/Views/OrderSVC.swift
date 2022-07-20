//
//  OrderSVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/8/22.
//

import SwiftUI

struct OrderSVC: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var services: Services
    
    var orderId: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationBar()
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
            NavigationBack()
            SignupModal()
            ScrollView {
                ForEach(CDOrderHelper.cdOrderHelper.getOrderItems(orderId: orderId!), id: \.item.id) { item in
                    OrderItemSVC(it: item)
                }
            }
            .padding(.horizontal, 15)
            Spacer()
            Text("Order ID: \(orderId!)")
                .padding(.horizontal)
                .font(.subheadline)
            OrderRefund(orderId: orderId!)
                .environmentObject(ordersManager)
            AltTabController()
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}


