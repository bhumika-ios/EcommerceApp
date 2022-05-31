//
//  ProductDetailView.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 31/05/22.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    var animation: Namespace.ID
    //Shared data model
    @EnvironmentObject var sharedData: SharedDataModel
    var body: some View {
        VStack{
            //Title bar and product Image
            VStack{
                // TitleBar
                HStack{
                    Button{
                        // closing View
                        withAnimation(.easeInOut){
                            sharedData.showDetailProduct = false
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    Spacer()
                     
                    Button{
                        
                    } label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color.black.opacity(0.7))
                        
                    }
                }
                .padding()
                
                // ProductImage
                Image(product.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "\(product.id)IMAGE", in: animation)
                    .padding(.horizontal)
                    .offset(y: -12)
                    .frame(maxHeight: .infinity)
                
                
            }
            .frame(height: getRect().height / 2.7)
            
            //product details
            ScrollView(.vertical, showsIndicators: false){
                //product data
                VStack(alignment: .leading, spacing: 15){
                    Text(product.title)
                        .font(.custom(customFont, size: 20).bold())
                    
                    Text(product.subtitle)
                        .font(.custom(customFont, size: 18))
                        .foregroundColor(.gray)
                    Text("Get Apple TV+ free for a year")
                        .font(.custom(customFont, size: 16).bold())
                        .padding(.top)
                    Text("Available when you purchase any new iPhone,iPad, Ipod,Mac or Apple TV, $ 4.99/ moth per free trial")
                        .font(.custom(customFont, size: 15))
                        .foregroundColor(.gray)
                    
                    Button{
                        
                    } label: {
                        Label {
                            Image(systemName: "arrow.right")
                        } icon: {
                             Text("Full Description")
                        }
                        .font(.custom(customFont, size: 15).bold())
                        .foregroundColor(Color("Purple"))
                    }
                    HStack{
                        Text("Total")
                            .font(.custom(customFont, size: 17))
                        
                        
                        Spacer()
                        
                        Text("\(product.price)")
                            .font(.custom(customFont, size: 20).bold())
                            .foregroundColor(Color("Purple"))
                    }
                    .padding(.vertical,20)
                    
                    Button{
                        
                    } label: {
                        Text("Add to Basket")
                            .font(.custom(customFont, size: 20).bold())
                            .foregroundColor(.white)
                            .padding(.vertical,20)
                            .frame(maxWidth:.infinity)
                            .background(Color("Purple")
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                            )
                    }
                }
                .padding([.horizontal,.bottom],20)
                .padding(.top,25)
                .frame(maxWidth: .infinity, alignment: .leading)
                
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
//        ProductDetailView(product: HomeViewModel().products[0])
//            .environmentObject(SharedDataModel())
        MainScreen()
    }
}
