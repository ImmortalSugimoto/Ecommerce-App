//
//  BackToHomePage.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/3/22.
//

import SwiftUI

struct BackToHomePage: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationLink(destination: MainTabControllerSVC(idx: 0).navigationTitle("").navigationBarHidden(true)) {
            Section {
                Text("BACK TO HOME")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color.red)
                
            }
            .foregroundColor(Color.white)
            .background(Color.red)
        }
    }
}

struct BackToHomePage_Previews: PreviewProvider {
    static var previews: some View {
        BackToHomePage()
            .environmentObject(CartManager())
    }
}
