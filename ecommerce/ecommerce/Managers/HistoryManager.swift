//
//  HistoryManager.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/7/22.
//

import Foundation

class HistoryManager: ObservableObject {
    @Published private(set) var history: [HistoryManagerHelper] = HistoryManagerHelper.fetchHistory()
    
    func addToHistory(product: NewProduct) {
        history.append(HistoryManagerHelper(product: product))
    }
    
    func getHistory() -> [HistoryManagerHelper] {
        return history
    }
    
}

class HistoryManagerHelper: Identifiable {
    var id = UUID()
    var product: NewProduct
    
    init(product: NewProduct) {
        self.product = product
    }
    
    static func fetchHistory() -> [HistoryManagerHelper] {
        var result = [HistoryManagerHelper]()
        
        for x in CDHistoryHelper.cdHistoryHelper.getSearchHistory() {
            result.append(HistoryManagerHelper(product: x))
        }
        return result
    }
    
}
