//
//  PreviewHelper.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/30/22.
//

import SwiftUI

struct PreviewHelper: View {
    var img: Image
    
    var body: some View {
        img
            .resizable()
            .scaledToFill()
            .clipped()
            .listRowInsets(EdgeInsets())
            .cornerRadius(15)
    }
}

struct PreviewHelper_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelper(img: ModelData().products[0].previews[0].img)
    }
}
