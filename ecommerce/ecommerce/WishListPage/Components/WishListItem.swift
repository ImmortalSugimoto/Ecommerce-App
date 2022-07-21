//
//  WishListItem.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/14/22.
//

import SwiftUI

struct WishListItem: View {
    @EnvironmentObject var wishlistManager: WishlistManager
    
    @Binding var showNextView: Bool
    @Binding var current: NewProduct
    var product: NewProduct
    var id: String
    
    var body: some View {
        HStack {
            Button(action: {
                current = product
                showNextView = true
            }) {
                Image(product.productIMG)
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .scaledToFill()
                    .clipped()
                    .listRowInsets(EdgeInsets())
                    .cornerRadius(15)
                VStack(alignment: .leading, spacing: 10) {
                    Text(product.name)
                        .bold()
                    Text(product.description)
                        .fontWeight(.light)
                        .lineLimit(2)
                        .foregroundColor(Color.black)
                    Text("$ \(product.price)")
                        .foregroundColor(Color.black)
                }
            }
            Spacer()
            Button(action: {
                wishlistManager.remoteFromWishlist(id: id)
                CDWishlistHelper.cdWishlistHelper.removeFromWishlist(wishlistItemID: id)
            }) {
                Image(systemName: "heart.slash.fill")
                    .resizable()
                    .foregroundColor(Color.orange)
                    .frame(width: 20, height: 20)
            }
            .frame(width: 50)
        }
        .padding(.horizontal)
        .padding([.top], 20)
        .frame(maxHeight: 200)
    }
}

//struct WishListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        WishListItem(showNextView: .constant(false), current: .constant(value: CategoryViewModel.placeholderProduct()), product: products[0])
//    }
//}
