//
//  OrderHistoryList.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/8/22.
//

import SwiftUI

struct OrderHistoryList: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var services: Services

    @State var ordersData = [Order]()
    @State var showNextView = false
    @State var current = ""
    
    var body: some View {
        Group {
            NavigationLink(destination:
                            OrderSVC(orderId: current)
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
                           , isActive: $showNextView) {
                EmptyView()
            }
            ScrollView {
                ForEach(ordersData.reversed(), id: \.id) { order in
                    Button(action: {
                        current = order.orderId
                        showNextView = true
                    }) {
                        OrderItem(orderObj: order)
                            .environmentObject(cartManager)
                            .environmentObject(ordersManager)
                    }
                    .padding([.bottom], 5)
                }
            }
            .padding([.top], 12)
        }
        .onAppear(perform: {
            ordersData = CDOrdersHelper.cdOrdersHelper.getOrders()
        })
    }
}

struct OrderHistoryList_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryList()
            .environmentObject(CartManager())
            .environmentObject(HistoryManager())
            .environmentObject(OrdersManager())
    }
}
