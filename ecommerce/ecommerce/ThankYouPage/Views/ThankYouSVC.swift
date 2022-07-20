//
//  ThankYouSVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/3/22.
//

import SwiftUI

struct ThankYouSVC: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var services: Services
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            ThankYouImage()
            ThankYouMessage()
            ThankYouSummary()
                .environmentObject(cartManager)
            ThankYouTotal()
                .environmentObject(cartManager)
            BackToHomePage()
            Spacer()
        }
        .padding([.leading, .trailing], 30)
        .padding([.top, .bottom], 25)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}


