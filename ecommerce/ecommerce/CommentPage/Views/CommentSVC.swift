//
//  CommentSVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/11/22.
//

import SwiftUI

struct CommentSVC: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var services: Services
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var titleText: String = ""
    @State var bodyText: String = ""
    @State var showAlert = false
    
    var product: NewProduct?
    
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
            VStack(alignment: .leading) {
                Text("Title")
                TextField("Enter title here", text: $titleText)
                Text("Body")
                TextField("Enter body text here", text: $bodyText)
                Spacer()
                Button {
                    let newComment = CommentModel(commentID: UUID().uuidString, productID: product!.id, username: userDefaults.string(forKey: "firstname")!, title: titleText, date: Date(), body: bodyText)
                    if (CommentViewModel.commentValidation(commentObj: newComment)) {
                        commentsManager.addComment(commentObj: newComment)
                        CDCommentHelper.cdCommentHelper.addComment(commentObj: newComment)
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        showAlert = true
                    }
                } label: {
                    Text("Submit")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .border(Color.red)
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.red)
            }
            .padding()
            .navigationTitle("")
            .navigationBarHidden(true)
            AltTabController()
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Notification"), message: Text("Please fill in all fields before continuing"), dismissButton: .default(Text("Dismiss")))
        }
        
    }
}
