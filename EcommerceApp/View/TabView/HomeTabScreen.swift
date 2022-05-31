//
//  HomeTabScreen.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 21/05/22.
//

import SwiftUI

struct HomeTabScreen: View {
    var animation: Namespace.ID
    
    //shared data
    @EnvironmentObject var sharedData: SharedDataModel
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
         
            VStack(spacing:15){
                //saerch bar
                ZStack{
                    if homeData.searchActive{
                        SearchBar()
                    }else{
                        SearchBar().matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                    }
                }
                .frame(width: getRect().width / 1.6)
                .padding(.horizontal,20)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut){
                        homeData.searchActive = true
                    }
                }
                
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
                
                // Product Screen
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 25){
                        ForEach(homeData.filteredProducts){product in
                            // Product cardview
                            ProductCrdView(product: product)
                        }
                    }
                    .padding(.horizontal,25)
                    .padding(.bottom)
                    .padding(.top,80)
                }
                .padding(.top,30)
                // see more button
                // this button show all product on the current product type
                //since here were showing only four
                Button{
                    homeData.showMoreProductsOnType.toggle()
                } label: {
                    Label {
                    Image(systemName: "arrow.right")
                    }icon: {
                        Text("See More...")
                    }
                    .font(.custom(customFont, size: 15).bold())
                    .foregroundColor(Color("Purple1"))
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
                .padding(.top, 10)
            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("LightGray"))
        
        //updating data whenever changes
        .onChange(of: homeData.productType){ newValue in homeData.filterProductByType()
        }
        	// preview issue
        .sheet(isPresented: $homeData.showMoreProductsOnType){
        
        }content: {
            MoreProductView()
        }
        // displaying searchview
        .overlay(
            ZStack{
                if homeData.searchActive{
                    SearchView(animation: animation)
                        .environmentObject(homeData)
                }
            }
        )
            
        
    }
    //adding  match geometry effect
    //avoiding code replication
    
    @ViewBuilder
    func SearchBar()->some View{
        
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
    }
    
    @ViewBuilder
    func ProductCrdView(product: Product)->some View{
        VStack(spacing: 10){
            // add geometry
            ZStack{
                if sharedData.showDetailProduct{
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(product.id)IMAGE", in: animation)
                }
            }
        
            .frame(width: getRect().width / 2.5, height: getRect().width / 2.5)
            // moving the image top to like at fixed at half top..
            .offset(y: -80)
            .padding(.bottom, -80)
            
            Text(product.title)
                .font(.custom(customFont, size: 14))
                .fontWeight(.semibold)
                .padding(.top)
            Text(product.subtitle)
                .font(.custom(customFont, size: 12))
                .foregroundColor(.gray)
            Text(product.price)
                .font(.custom(customFont, size: 13))
                .fontWeight(.bold)
                .foregroundColor(Color("Purple1"))
                .padding(.top,5)
        }
        .padding(.horizontal,20)
        .padding(.bottom,22)
        .background(
            Color.white
                .cornerRadius(25)
        )
        //showing product detail when tapped
        .onTapGesture {
            withAnimation(.easeInOut){
                sharedData.detailProduct = product
                sharedData.showDetailProduct = true
            }
        }
        
        
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
                            //match geometry effect
                                .matchedGeometryEffect(id: "PRODUCTTAB", in: animation)
                                .frame( height: 2)
                        } else{
                            Capsule()
                                .fill(Color.clear)
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
        MainScreen()
    }
}

