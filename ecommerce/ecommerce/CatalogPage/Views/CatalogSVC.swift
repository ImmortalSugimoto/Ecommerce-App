//
//  CatalogSVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/6/22.
//

import SwiftUI

struct CatalogSVC: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var services: Services

    var body: some View {
        VStack {
            NavigationBar()
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
            ScrollView {
                SignupModal()
                CatalogAd(img: "catalog/c6a13e043f5b874eaf0cfadcb2802bef")
                CatalogCategories()
                    .environmentObject(cartManager)
                    .environmentObject(historyManager)
                    .environmentObject(ordersManager)
                    .environmentObject(commentsManager)
                    .environmentObject(wishlistManager)
                    .environmentObject(services)
                CatalogAd(img: "catalog/szxm6eoPQq5avEnDen2omR-1024-80")
                CatalogFeatured()
                CatalogAd(img: "catalog/9bf037e1886f5de27c01b532fb552b2c")
                About()
                FooterHelper()
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}


