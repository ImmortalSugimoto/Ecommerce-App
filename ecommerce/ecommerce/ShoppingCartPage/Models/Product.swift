//
//  Product.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/29/22.
//

import Foundation
import SwiftUI

struct Product: Identifiable {
    var id: Int
    var name: String
    var description: String
    var featured: Bool
    var features: String
    var category: String
    var price: Int
    var cartIMG: Image
    var productIMG: Image
    var contents: [Item]
    var previews: [Preview]
    var recommended: [Recommended]
    var new: Bool
}

struct Item {
    var quantity: Int
    var item: String
}

struct Preview {
    var img: Image
}

struct Recommended {
    var name: String
    var img: Preview
    
}


