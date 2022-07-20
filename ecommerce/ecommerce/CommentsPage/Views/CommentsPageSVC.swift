//
//  CommentPageSVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/11/22.
//

import SwiftUI

struct CommentsPageSVC: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var services: Services
    
    @State var showNextView = false
    @State var showAlert = false
    
    var product: NewProduct?
    var loggedIn = userDefaults.bool(forKey: "isLoggedIn")
    
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
            NavigationLink(destination:
                            CommentSVC(product: product)
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
                           , isActive: $showNextView) {
                EmptyView()
            }
            VStack {
                HStack {
                    Text("Comments")
                        .font(.title)
                        .bold()
                    Spacer()
                    Button {
                        if (loggedIn) {
                            showNextView = true
                            showAlert = false
                        } else {
                            showNextView = false
                            showAlert = true
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding([.top, .bottom, .leading, .trailing], 10)
                    .foregroundColor(Color.white)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                }
                ScrollView {
                    ForEach(CDCommentHelper.cdCommentHelper.getComments(productID: product!.id).reversed(), id: \.commentID) { comment in
                        CommentItem(comment: comment)
                    }
                }
            }
            .padding(.horizontal, 15)
            .padding([.top], 15)
            Spacer()
            AltTabController()
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
        }
        .onAppear(perform: {
            commentsManager.loadComments(commentsData: CDCommentHelper.cdCommentHelper.getComments(productID: product!.id))
        })
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Notification"), message: Text("Please log in first to add new comments"), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

