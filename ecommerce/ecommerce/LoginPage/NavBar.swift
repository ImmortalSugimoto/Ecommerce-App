//
//  NavBar.swift
//  ecommerce
//
//  Created by xcode on 7/3/22.
//

import UIKit
import SwiftUI
class NavBar: UINavigationController {

    struct NavigationBar: View {
        var body: some View {
            HStack {
                Button {
                   print("remove")
                } label: {
                    Image(systemName: "line.3.horizontal")
                }
                Spacer()
                Text("/ShopIt")
                    .foregroundColor(.white)
                Spacer()
                Button {
                   print("add")
                } label: {
                    Image(systemName: "cart")
                }
            }
            .padding([.leading, .trailing], 27)
            .padding([.top, .bottom], 20)
            .background(Color.black)
        }
    }

    struct NavigationBar_Previews: PreviewProvider {
        static var previews: some View {
            NavigationBar()
        }
    }
}
