//
//  SearchHistorySVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/7/22.
//

import SwiftUI

struct SearchHistorySVC: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var services: Services
    
    @State var showNextView = false
    @State var current = HomePageViewModel.placeHolderProduct()
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationBar()
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
            SignupModal()
            Text("Recent Searches")
                .font(.title2)
                .bold()
                .padding(.horizontal)
                .padding(.top)
            ScrollView {
                ForEach(historyManager.history.reversed(), id: \.id) { x in
                    Button(action: {
                        current = x.product
                        showNextView = true
                    }) {
                        SearchHistoryItem(product: x.product)
                    }
                }
            }
            .padding(.horizontal)
            NavigationLink(destination: ProductSVC(product: current).environmentObject(cartManager).environmentObject(historyManager).environmentObject(ordersManager).environmentObject(commentsManager).environmentObject(wishlistManager).environmentObject(services), isActive: $showNextView) {
                EmptyView()
            }
            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}


