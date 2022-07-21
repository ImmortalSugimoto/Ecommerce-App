//
//  WishlistManager.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/14/22.
//

import Foundation

class WishlistManager: ObservableObject {
    @Published private(set) var wishlist: [WishlistItemModel] = []
    
    func addToWishlist(wishlistItemObj: WishlistItemModel) {
        wishlist.append(wishlistItemObj)
    }
    
    func remoteFromWishlist(id: String) {
        wishlist = wishlist.filter {
            $0.id != id
        }
    }
    
    func getWishlist(userId: String) {
        wishlist = CDWishlistHelper.cdWishlistHelper.getWishlist(userId: userId)
    }
    
}
