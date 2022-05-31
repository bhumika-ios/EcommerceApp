//
//  ProductDetailView.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 31/05/22.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    
    //Shared data model
    @EnvironmentObject var sharedData: SharedDataModel
    var body: some View {
        VStack{
            //Title bar and product Image
            VStack{
                
            }
            .frame(height: getRect().height / 2.7)
            
            //product details
            ScrollView(.vertical, showsIndicators: false){
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                //corner Radius for only top side
                    .clipShape(CustomCorner(corner: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
            )
        }
        .background(Color("LightGray").ignoresSafeArea())
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: HomeViewModel().products[0])
            .environmentObject(SharedDataModel())
    }
}
