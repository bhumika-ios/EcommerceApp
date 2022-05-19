//
//  OnBoardingScreen.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 19/05/22.
//

import SwiftUI


// To use the custom font all screen

struct OnBoardingScreen: View {
    var body: some View {
        VStack{
            Text("Find your\nGadget")
                .font(.custom(<#T##name: String##String#>, size: <#T##CGFloat#>))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("Purple")
        )
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen()
    }
}
