//
//  HomeViewModel.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 21/05/22.
//

import SwiftUI

class  HomeViewModel: ObservableObject {
    @Published var productType: ProductType = .Wearable
    
    // sample product
    @Published var products: [Product] = [
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6: Red",   price: "60000", productImage: "AppleWatch6"),
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6: Black",   price: "50000", productImage: "AppleWatch5"),
        Product(type: .Wearable, title: "iPhone8", subtitle: "A14: Blue",   price: "49000", productImage: "iPhone8"),
        Product(type: .Wearable, title: "iPhone12", subtitle: "A13: Pink",   price: "59000", productImage: "iPhone12"),
        Product(type: .Wearable, title: "iPhone13", subtitle: "A15: Purple",   price: "69000", productImage: "iPhone13"),
        Product(type: .Wearable, title: "MacAirBook", subtitle: "M1 6: White",   price: "160000", productImage: "MacAirBook"),
        Product(type: .Wearable, title: "iPadPro", subtitle: "M1: Gold",   price: "90000", productImage: "iPadPro"),
        Product(type: .Wearable, title: "iPadAir4", subtitle: "M1: Silver",   price: "100000", productImage: "iPadAir4"),
        Product(type: .Wearable, title: "AppleWatch14", subtitle: "Series 6: Gray",   price: "80000", productImage: "AppleWatch14"),
    ]
}
  
