//
//  OnBoardingScreen.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 19/05/22.
//

import SwiftUI


// To use the custom font all screen
let customFont = "Raleway-Regular"
struct OnBoardingScreen: View {
    var body: some View {
        VStack{
            Text("Find your\nGadget")
                .font(.custom(customFont, size: 55))
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
