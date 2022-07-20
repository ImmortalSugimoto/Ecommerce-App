//
//  CategorySVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/3/22.
//

import SwiftUI

struct CategorySVC: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var services: Services
    
    let columns: [GridItem] = [GridItem(.flexible())]
    var category: String
    let loggedIn = userDefaults.bool(forKey: "isLoggedIn")
    
    var body: some View {
        VStack {
            NavigationBar()
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
            NavigationBack()
            ScrollView {
                if (!loggedIn) {
                    SignupModal()
                }
                VStack(spacing: 20) {
                    CategoryHero()
                    CategoryFeatured(filteredProducts: CategoryViewModel.filterByCategory(targetCategory: category, productData: services.productData))
                        .environmentObject(cartManager)
                        .environmentObject(historyManager)
                        .environmentObject(ordersManager)
                        .environmentObject(commentsManager)
                        .environmentObject(wishlistManager)
                        .environmentObject(services)
                    CategoryResults(filteredProducts: CategoryViewModel.filterByCategory(targetCategory: category, productData: services.productData))
                        .environmentObject(cartManager)
                        .environmentObject(historyManager)
                        .environmentObject(ordersManager)
                        .environmentObject(commentsManager)
                        .environmentObject(wishlistManager)
                        .environmentObject(services)
                }
            }
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

