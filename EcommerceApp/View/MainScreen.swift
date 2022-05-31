//
//  MainScreen.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 21/05/22.
//

import SwiftUI

struct MainScreen: View {
    // current tab
    @State var currentTab: Tab = .Home
    
    @StateObject var sharedData: SharedDataModel = SharedDataModel()
    
    @Namespace var animation
    
    //Hidding tabbar
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
       //Tab View
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                HomeTabScreen(animation: animation)
                    .environmentObject(sharedData)
                    .tag(Tab.Home)
                Text("Like")
                    .tag(Tab.Like)
                ProfileScreen()
                    .tag(Tab.Profile)
                Text("Cart")
                    .tag(Tab.Cart)
                
            }
            // custom tabbar
            HStack(spacing: 0){
                ForEach(Tab.allCases,id: \.self){tab in
                    Button{
                        // updating tab
                        currentTab = tab
                    }label: {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:22, height: 22)
                        // apply little shadow at backgroung
                            .background(
                                Color("Purple")
                                    .opacity(1.0)
                                    .cornerRadius(5)
                                // blurring
                                    .blur(radius: 5)
                                 //making little big
                                   .padding(-7)
                                   .opacity(currentTab == tab ? 1 : 0)
                            )
                            .frame(maxWidth:.infinity )
                            .foregroundColor(currentTab == tab ? Color("Purple1") : Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal,.bottom])
            .padding(.bottom,10)
        }
        .background(Color("LightGray").ignoresSafeArea())
        .overlay(
            ZStack{
                // detail screen
                if let product = sharedData.detailProduct,sharedData.showDetailProduct{
                    
                    ProductDetailView(product: product, animation: animation)
                        .environmentObject(sharedData)
                    //adding transition
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
            }
        )
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
    
}
enum Tab: String,CaseIterable {
    // row value is image name is asset
    case Home = "Home1"
    case Like = "Like"
    case Profile = "Profile1"
    case Cart = "Cart"
}
