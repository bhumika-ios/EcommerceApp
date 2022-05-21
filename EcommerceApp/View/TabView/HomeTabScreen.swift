//
//  HomeTabScreen.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 21/05/22.
//

import SwiftUI

struct HomeTabScreen: View {
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
         
            VStack(spacing:15){
            
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    // need to separate view for search bar
                    TextField("Search", text: .constant(""))
                        .disabled(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                        Capsule()
                            .strokeBorder(Color.gray,lineWidth: 0.8)
                        
                )
                .frame(width: getRect().width / 1.6)
                .padding(.horizontal,20)
                
                 Text("Order online\ncollect in Store")
                    .font(.custom(customFont, size: 28).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal,25)
                // product tab
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 18){
                        ForEach(ProductType.allCases,id: \.self){ type in
                            // product type view
                            ProductTypeView(type: type)
                            
                        }
                        
                    }
                    .padding(.horizontal, 25)
                }
                .padding(.top, 28)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
    @ViewBuilder
    func ProductTypeView(type: ProductType)->some View{
        Button{
            // Updating current type
            homeData.productType = type
        } label: {
            Text(type.rawValue)
                .font(.custom(customFont, size: 15))
                .fontWeight(.semibold)
            
            // changing color current product related
                .foregroundColor(homeData.productType == type ? Color("Purple") : Color.gray)
                .padding(.bottom,10)
            // Adding indicator for lining
                .overlay(
                
                    ZStack{
                        if homeData.productType == type{
                            Capsule()
                                .fill(Color("Purple"))
                                .frame( height: 2)
                        }
                    }
                        .padding(.horizontal,-5)
                    ,alignment: .bottom
                )
        }
        
        
    }
}

struct HomeTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabScreen()
    }
}

