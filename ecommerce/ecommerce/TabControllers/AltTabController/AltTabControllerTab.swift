//
//  AltTabControllerTab.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/19/22.
//

import SwiftUI

struct AltTabControllerTab: View {
    
    @Binding var showHome: Bool
    @Binding var showCatalog: Bool
    @Binding var showHistory: Bool
    @Binding var showOrders: Bool
    @Binding var showWishlist: Bool
    @Binding var selector: Int
    
    var systemIMG: String
    var tabName: String
    var tabNum: Int
    
    var body: some View {
        Button(action: {
            selector = tabNum
            switch(tabNum) {
            case 0: showHome = true
            case 1: showCatalog = true
            case 2: showHistory = true
            case 3: showOrders = true
            case 4: showWishlist = true
            default:
                print("")
            }
            
        }) {
            VStack {
                Image(systemName: systemIMG)
                    .resizable()
                    .frame(width: 24, height: 22)
                    .foregroundColor(Color.altNavigationBarTab)
                Text(tabName)
                    .foregroundColor(Color.altNavigationBarTab)
                    .font(.caption2)
            }
            
        }
    }
}

//struct AltTabControllerTab_Previews: PreviewProvider {
//    static var previews: some View {
//        AltTabControllerTab(systemIMG: "image", tabName: "name")
//    }
//}
