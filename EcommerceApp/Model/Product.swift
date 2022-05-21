//
//  ProductScreen.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 21/05/22.
//

import SwiftUI
// PRODUCT model
struct Product: Identifiable, Hashable {
    var id = UUID().uuidString
    var type: ProductType
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String
    var productImage: String = ""
    var quantity: Int = 1
}
// product types..
enum ProductType: String,CaseIterable{
    case Wearable = "Wearable"
    case Laptops = "Laptops"
    case Phones = "Phones"
    case Tablets = "Tablets"
}
