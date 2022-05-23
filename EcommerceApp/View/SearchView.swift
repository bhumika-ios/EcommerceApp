//
//  SearchView.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 23/05/22.
//

import SwiftUI

struct SearchView: View {
   // var animation: Namespace.ID
    
    @EnvironmentObject var homeData: HomeViewModel
    //Activating text field with help of focusStatus.
    @FocusState var startTF: Bool
    var body: some View {
        VStack{
            //SearchBar
            HStack(spacing: 15){
                //close button
                Button{
                    withAnimation{
                        homeData.searchActive = false
                    }
                }label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(Color.black.opacity(0.7))
                }
                //searchbar
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    // need to separate view for search bar
                    TextField("Search", text: $homeData.searchText)
                        .focused($startTF)
                        .textCase(.lowercase)
                        .disableAutocorrection(true)
                      
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                        Capsule()
                            .strokeBorder(Color("Purple"),lineWidth: 1.5)
                        
                )
             //   .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                .padding(.trailing, 20)
            }
            .padding([.horizontal])
            .padding(.top)
            // filter result
            ScrollView(.vertical, showsIndicators: false){
                //staggered Grid..
                
                StaggeredGrid(columns: 2,spacing: 20, list: homeData.products){ product in
                    // card view
                    ProductCrdView(product: product)
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
        Color("LightGray").ignoresSafeArea()
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                startTF = true
            }
        }
    }
    @ViewBuilder
    func ProductCrdView(product: Product)->some View{
        VStack(spacing: 10){
        Image(product.productImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            
            // moving the image top to like at fixed at half top..
            .offset(y: -50)
            .padding(.bottom, -50)
            
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
        .padding(.top, 50)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().environmentObject(HomeViewModel())
    }
}
