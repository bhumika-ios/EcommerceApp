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
    var body: some View {
       //Tab View
        TabView(selection: $currentTab) {
            Text("Home")
                .tag(Tab.Home)
            Text("Like")
                .tag(Tab.Like)
            Text("Profile")
                .tag(Tab.Profile)
            Text("Cart")
                .tag(Tab.Cart)
            
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
    
}
enum Tab: String {
    // row value is image name is asset
    case Home = "Home"
    case Like = "Like"
    case Profile = "Profile"
    case Cart = "Cart"
}
