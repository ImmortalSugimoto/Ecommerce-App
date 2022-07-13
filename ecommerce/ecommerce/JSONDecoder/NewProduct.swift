//
//  Product.swift
//  ecommerce
//
//  Created by Vincent Salinas on 6/29/22.
//

import Foundation
import SwiftUI

struct NewProduct: Decodable, Identifiable {
    var id: Int
    var name: String
    var category: String
    var new: Bool
    var price: Int
    var featured: Bool
    var cartIMG: String
    var productIMG: String
    var description: String
    var features: String
    var contents: [NewItem]
    var previews: [NewPreview]
    var recommended: [NewRecommended]
}

struct NewItem: Decodable {
    var quantity: Int
    var item: String
}

struct NewPreview: Decodable {
    var img: String
}

struct NewRecommended: Decodable {
    var name: String
    var img: String
}

