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
        Product(type: .Phones, title: "iPhone8", subtitle: "A14: Blue",   price: "49000", productImage: "iPhone8"),
        Product(type: .Phones, title: "iPhone12", subtitle: "A13: Pink",   price: "59000", productImage: "iPhone12"),
        Product(type: .Phones, title: "iPhone13", subtitle: "A15: Purple",   price: "69000", productImage: "iPhone13"),
        Product(type: .Laptops, title: "MacAirBook", subtitle: "M1 6: White",   price: "160000", productImage: "MacAirBook"),
        Product(type: .Tablets, title: "iPadPro", subtitle: "M1: Gold",   price: "90000", productImage: "iPadPro"),
        Product(type: .Laptops, title: "iPadAir4", subtitle: "M1: Silver",   price: "100000", productImage: "iPadAir4"),
        Product(type: .Wearable, title: "AppleWatch14", subtitle: "Series 6: Gray",   price: "80000", productImage: "AppleWatch14"),
    ]
    // filteredn product
    @Published var filteredProducts: [Product] = []
    //More the product on the type
    @Published var showMoreProductsOnType: Bool = false
    
    //Search Data..
    @Published var searchText: String = ""
    @Published var searchActive: Bool = false
    
    init(){
        filterProductByType()
    }
    
    func filterProductByType(){
        //filtering product by type
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
            //require more memory so using lazy perform
                .lazy
                .filter { product in
                    return product.type == self.productType
                }
            //limiting result
                .prefix(4)
            DispatchQueue.main.async {
                
                self.filteredProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
}
  
