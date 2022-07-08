//
//  CategoryResults.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/3/22.
//

import SwiftUI

struct CategoryResults: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var historyManager: HistoryManager
    
    var modelData = products
    
    let columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("RESULTS")
                .font(.title2)
                .bold()
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(modelData, id: \.id) { product in
                        NavigationLink(destination: ProductSVC(product: product).environmentObject(cartManager).environmentObject(historyManager)) {
                            CategoryItemHelper(product: product)
                        }
                    }
                }
            }
        }
        .padding([.leading, .trailing], 17)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct CategoryResults_Previews: PreviewProvider {
    static var previews: some View {
        CategoryResults()
            .environmentObject(CartManager())
            .environmentObject(HistoryManager())
    }
}
