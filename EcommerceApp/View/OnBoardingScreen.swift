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
        VStack(alignment: .leading){
            Text("Find your\nGadget")
                .font(.custom(customFont, size: 55))
            //added all three font used
                .fontWeight(.bold)
                .foregroundColor(Color("Purple"))
            Image("ob1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Button{
                
            } label: {
                Text("Get started")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical,18)
                    .frame(maxWidth:.infinity)
                    .background(Color("Purple"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
            }
            .padding(.horizontal,10)
            // add small distance for larger display
            .offset(y:20)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("white")
        )
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen()
            .previewDevice("iPhone1")
        OnBoardingScreen()
            .previewDevice("iPhone12")
        
    }
}
