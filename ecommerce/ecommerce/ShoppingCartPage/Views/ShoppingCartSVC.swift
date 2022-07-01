//
//  ShoppingCartSVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/29/22.
//

import SwiftUI

struct ShoppingCartSVC: View {
    var modelData = ModelData()
    
    private var gridItemLayout = [GridItem(.flexible())]
    
    var body: some View {
        VStack {
            NavigationBar()
            HStack {
                Text("CART \(modelData.products.count)")
                Spacer()
                Button("Remove All") {
                    
                }
            }
            .padding([.leading, .trailing], 27)
            .padding([.top, .bottom], 15)
            ScrollView(.vertical) {
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(0..<modelData.products.count) { index in
                        HStack(spacing: 15) {
                            modelData.products[index].cartIMG
                                .resizable()
                                .frame(width: 100, height: 100)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(modelData.products[index].name)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                Text("$ \(modelData.products[index].price)")
                            }
                            AddRemoveItem()
                        }
                    }
                }
            }
            .padding([.leading, .trailing], 24)
            VStack(spacing: 10) {
                HStack {
                    Spacer()
                    Text("TOTAL")
                        .fontWeight(.light)
                        .lineLimit(1)
                    Text("$ \(getTotal(products: modelData.products))")
                }
                HStack {
                    Spacer()
                    Button("CHECKOUT") {
                        
                    }
                }
            }
            .padding([.leading, .top, .trailing, .bottom], 27)
        }
        
    }
    
}

struct ShoppingCartSVC_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartSVC()
    }
}