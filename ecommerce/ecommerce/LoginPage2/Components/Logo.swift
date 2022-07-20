//
//  Logo.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/19/22.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        Image("appstore")
            .resizable()
            .frame(width: 200, height: 200)
            .aspectRatio(contentMode: .fill)
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
