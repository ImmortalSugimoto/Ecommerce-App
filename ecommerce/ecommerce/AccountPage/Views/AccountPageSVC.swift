//
//  AccountPageSVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/16/22.
//

import SwiftUI

struct AccountPageSVC: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var services: Services
    
    @State var showNextView = false
    @State var loggedIn = userDefaults.bool(forKey: "isLoggedIn")
    
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
            Spacer()
            NavigationLink(destination: MainTabControllerSVC(idx: 0).navigationTitle("").navigationBarHidden(true), isActive: $showNextView) {
                EmptyView()
            }
            VStack {
                Button(action: {
                    showNextView = true
                    LoginPageViewModel.resetUserDefaults()
                }) {
                    Text("Log Out")
                        .fontWeight(.light)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .border(loggedIn ? Color.red : Color.gray.opacity(0.5))
                }
                .disabled(!loggedIn)
                .foregroundColor(Color.white)
                .background(loggedIn ? Color.red : Color.gray.opacity(0.5))
                
            }
            .padding()
            AltTabController()
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
        }
    }
}

