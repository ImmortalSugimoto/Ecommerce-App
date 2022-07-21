//
//  CartState.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/2/22.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var items: [CartItem] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: NewProduct, qty: Int) {
        items.append(CartItem(item: product, unitPrice: product.price, quantity: qty))
    }
    
    func incrementQty(it: CartItem) {
        if let idx = self.items.firstIndex(where: { $0.item.id == it.item.id}) {
            items[idx].quantity += 1
        }
    }
    
    func decrementQty(it: CartItem) {
        if let idx = self.items.firstIndex(where: { $0.item.id == it.item.id}) {
            items[idx].quantity -= 1
        }
    }
    
    func getTotal() -> Int {
        var result = 0
        for x in items {
            result += x.unitPrice * x.quantity
        }
        return result
    }
    
    func clearCart() {
        items = []
    }
    
}

enum AddedCosts: Int {
    case tax = 5
    case shipping = 10
}
