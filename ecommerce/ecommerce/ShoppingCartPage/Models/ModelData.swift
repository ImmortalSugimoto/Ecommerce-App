//
//  ModelData.swift
//  Landmarks
//
//  Created by Vincent Salinas on 6/23/22.
//

import Foundation
import SwiftUI

final class ModelData {
    var products = [
        Product(
            id: 0,
            name: "XX99 Mark II Headphones",
            description: "The new XX99 Mark II headphones is the pinnacle of pristine audio. It redefines your premium headphone experience by reproducing the balanced depth and precision of studio-quality sound.",
            featured: true,
            features: "Featuring a genuine leather head strap and premium earcups, these headphones deliver superior comfort for those who like to enjoy endless listening. It includes intuitive controls designed for any situation. Whether you’re taking a business call or just in your own personal space, the auto on/off and pause features ensure that you’ll never miss a beat.\n\nThe advanced Active Noise Cancellation with built-in equalizer allow you to experience your audio world on your terms. It lets you enjoy your audio in peace, but quickly interact with your surroundings when you need to. Combined with Bluetooth 5. 0 compliant connectivity and 17 hour battery life, the XX99 Mark II headphones gives you superior sound, cutting-edge technology, and a modern design aesthetic.",
            category: "headphones",
            price: 2999,
            cartIMG: Image("cart/image-xx99-mark-two-headphones"),
            productIMG: Image("product-xx99-mark-two-headphones/image-category-page-preview"),
            contents: [
                Item(quantity: 1, item: "Headphone Unit"),
                Item(quantity: 2, item: "Replacement Earcups"),
                Item(quantity: 1, item: "User Manual"),
                Item(quantity: 1, item: "3.5mm 5m Audio Cable"),
                Item(quantity: 1, item: "Travel Bag"),
            ],
            previews: [
                Preview(img: Image("product-xx99-mark-two-headphones/image-gallery-1")),
                Preview(img: Image("product-xx99-mark-two-headphones/image-gallery-2")),
                Preview(img: Image("product-xx99-mark-two-headphones/image-gallery-3")),
            ],
            recommended: [
                Recommended(name: "XX99 Mark I", img:                 Preview(img: Image("shared/image-xx99-mark-one-headphones"))),
                Recommended(name: "XX59 Headphones", img:                 Preview(img: Image("shared/image-xx59-headphones"))),
                Recommended(name: "ZX9 Speaker", img:                 Preview(img: Image("shared/image-zx9-speaker"))),
            ],
            new: true
        ),
        
    ]
}

