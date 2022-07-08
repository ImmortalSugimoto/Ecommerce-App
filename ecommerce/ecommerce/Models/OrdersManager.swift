//
//  OrdersManager.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/8/22.
//

import Foundation

class OrdersManager: ObservableObject {
    @Published private(set) var orders: [Order] = []
    
    func addToHistory(cart: [CartItem]) {
        orders.append(Order(items: cart))
        print("Added order to orders history")
    }
    
    func getHistory() -> [Order] {
        return orders
    }
    
}

class Order: Identifiable {
    var id = UUID()
    var date = Date()
    var items: [CartItem]
    
    init(items: [CartItem]) {
        self.items = items
    }
}
