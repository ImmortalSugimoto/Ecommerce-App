//
//  FooterHelper.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/30/22.
//

import SwiftUI

struct FooterHelper: View {
    var name = "Amazona"
    
    enum Categories: String {
        case home = "HOME"
        case headphones = "HEADPHONES"
        case speakers = "SPEAKERS"
        case earphones = "EARPHONES"
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Text(name)
                .font(.title)
                .bold()
            VStack(spacing: 10) {
                Text(Categories.home.rawValue)
                    .bold()
                Text(Categories.headphones.rawValue)
                    .bold()
                Text(Categories.speakers.rawValue)
                    .bold()
                Text(Categories.earphones.rawValue)
                    .bold()
            }
            Text("Amazona is an all in one stop to fulfill your audio needs. We're a small team of music lovers and sound specialists who are devoted to helping you get the most out of personal audio. Come and visit our demo facility - we’re open 7 days a week.")
                .multilineTextAlignment(.center)
            Text("Copyright 2022. All Rights Reserved")
                .multilineTextAlignment(.center)
        }
        .padding([.leading, .trailing], 27)
        .padding([.top, .bottom], 40)
        .foregroundColor(Color.white)
        .background(Color.black)
    }
}

struct FooterHelper_Previews: PreviewProvider {
    static var previews: some View {
        FooterHelper()
    }
}
