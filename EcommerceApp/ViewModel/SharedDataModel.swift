//
//  SharedDataModel.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 31/05/22.
//

import SwiftUI

class SharedDataModel: ObservableObject{
    // Detail Product Data..
    @Published var detailProduct: Product?
    @Published var showDetailProduct: Bool = false
}
   
