//
//  WishListPageSVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/14/22.
//

import SwiftUI

struct WishListPageSVC: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var services: Services
    
    @State var showNextView = false
    @State var current: NewProduct = CategoryViewModel.placeholderProduct()
    
    let loggedIn = userDefaults.bool(forKey: "isLoggedIn")
    let userId = userDefaults.string(forKey: "userId")
    
    var body: some View {
        VStack {
            NavigationBar()
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
            SignupModal()
            HStack {
                Text("Wish List")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                Spacer()
            }
            ScrollView {
                if (loggedIn) {
                    ForEach(wishlistManager.wishlist.reversed(), id: \.id) { item in
                        WishListItem(showNextView: $showNextView, current: $current, product: WishlistViewModel.getProduct(productID: item.productId), id: item.id)
                            .environmentObject(wishlistManager)
                    }
                }
            }
            NavigationLink(destination: ProductSVC(product: current).environmentObject(cartManager).environmentObject(historyManager).environmentObject(ordersManager).environmentObject(commentsManager).environmentObject(wishlistManager).environmentObject(services), isActive: $showNextView) {
                EmptyView()
            }
            
        }
        .onAppear(perform: {
            wishlistManager.getWishlist(userId: userId!)
        })
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

