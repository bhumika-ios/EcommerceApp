//
//  LikedScreen.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 01/06/22.
//

import SwiftUI

struct LikedScreen: View {
    @EnvironmentObject var sharedData: SharedDataModel
    @EnvironmentObject var homeData: HomeViewModel
    
    //Delete Option
    @State var showDeleteOption: Bool = false
    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    HStack{
                        Text("Favourites")
                            .font(.custom(customFont, size: 28).bold())
                        
                        Spacer()
                        Button{
                            withAnimation{
                                showDeleteOption.toggle()
                            }
                        } label: {
                            Image("Delete")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                            
                        }
                    }
                    // checking liked or not
                    if !sharedData.likedProducts.isEmpty{
                        Group{
                            Image(systemName:"heart.slash.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .foregroundColor(Color("Purple"))
                                .padding()
                                .padding(.top,35)
                            
                            Text("Not favorites yet..")
                                .font(.custom(customFont, size: 25))
                                .fontWeight(.semibold)
                            
                            Text("Hit the like button on each product page to save favorite ones.")
                                .font(.custom(customFont, size: 18))
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                                .padding(.top,10)
                                .multilineTextAlignment(.center)
                        }
                    } else {
                        // Displaying product
                        VStack(spacing: 15){
                            // for designing
                            ForEach(homeData.products){product in
                                
                                HStack(spacing: 0){
                                    if showDeleteOption{
                                        Button{
                                        
                                        } label: {
                                            Image(systemName: "minus.circle.fill")
                                                .font(.title2)
                                                .foregroundColor(.red)
                                        }
                                        .padding(.trailing)
                                    }
                                    CardView(product: product)
                                    
                                }
                            }
                        }
                        .padding(.top,25)
                        .padding(.horizontal)
                    }
                }.padding()
                
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                Color("LightGray")
                    .ignoresSafeArea()
                )
        }
    }
    @ViewBuilder
    func CardView(product: Product)->some View{
        HStack(spacing: 15){
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 8){
                
                Text(product.title)
                    .font(.custom(customFont, size: 18).bold())
                
                Text(product.subtitle)
                    .font(.custom(customFont, size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Purple"))
                
                Text("Type: \(product.type.rawValue)")
                    .font(.custom(customFont, size: 13))
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color.white
                .cornerRadius(10)
        )
    }
}

struct LikedScreen_Previews: PreviewProvider {
    static var previews: some View {
        LikedScreen()
            .environmentObject(SharedDataModel())
            .environmentObject(HomeViewModel())
    }
}
