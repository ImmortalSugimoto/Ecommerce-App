//
//  CheckoutSummary.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/29/22.
//

import SwiftUI

struct CheckoutSummary: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    @EnvironmentObject var ordersManager: OrdersManager
    @EnvironmentObject var commentsManager: CommentsManager
    @EnvironmentObject var wishlistManager: WishlistManager
    @EnvironmentObject var services: Services
    
    @State var showNextView = false
    @State var showAlert = false
    
    var checkoutDetailsObj: CheckoutDetailsObj
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("SUMMARY")
            NavigationLink(destination:
                            ThankYouSVC()
                .environmentObject(cartManager)
                .environmentObject(historyManager)
                .environmentObject(ordersManager)
                .environmentObject(commentsManager)
                .environmentObject(wishlistManager)
                .environmentObject(services)
                .onAppear{
                    let newOrder = OrdersViewModel.createNewOrder()
                    ordersManager.addToHistory(order: newOrder)
                    CDOrdersHelper.cdOrdersHelper.addOrder(orderObj: newOrder)
                    CheckoutViewModel.storeOrderItems(orderId: newOrder.orderId, cart: cartManager.items)
                }, isActive: $showNextView) {
                    EmptyView()
                }
            ScrollView {
                ForEach(cartManager.items, id: \.item.id) { it in
                    HStack {
                        Image(it.item.cartIMG)
                            .resizable()
                            .frame(width: 100, height: 100)
                        VStack(alignment: .leading, spacing: 5) {
                            Text(it.item.name)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .lineLimit(1)
                            Text("$ \(it.item.price)")
                        }
                        Spacer()
                        VStack {
                            Text("\(it.quantity)x")
                                .foregroundColor(Color.gray)
                                .padding()
                        }
                    }
                }
                CheckoutDetails()
                    .environmentObject(cartManager)
                Button(action: {
                    showNextView = CheckoutViewModel.validateForm(checkoutDetailsObj: checkoutDetailsObj)
                    showAlert = !CheckoutViewModel.validateForm(checkoutDetailsObj: checkoutDetailsObj)
                }) {
                    Text("CONTINUE & PAY")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .border(Color.red)
                }
                .foregroundColor(Color.white)
                .background(Color.red)
            }
            .padding([.top], 13)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .alert(isPresented: $showAlert, content: {
            messageBox(title: "Notification", msg: "Please fill in all fields before continuing")
        })
    }
}

struct CheckoutSummary_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutSummary(checkoutDetailsObj: CheckoutDetailsObj(name: "", email: "", phoneNumber: "", address: "", zip: "", city: "", country: ""))
            .environmentObject(CartManager())
            .environmentObject(OrdersManager())
    }
}
