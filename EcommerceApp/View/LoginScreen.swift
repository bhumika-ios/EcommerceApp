//
//  LoginScreen.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 19/05/22.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject var loginData: LoginScreenModel = LoginScreenModel()
    var body: some View {
        VStack{
            // three half screen
            
            
        
                Text("Welcome\nback")
                    .font(.custom(customFont, size: 55).bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: getRect().height / 3.5)
                    .padding()
                
           
           
            ScrollView(.vertical,showsIndicators: false){
                
            }
            .frame(maxWidth:.infinity , maxHeight: .infinity)
            .background(
                Color.white
                // apply custom corner
                    .clipShape(CustomCorner(corner: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
            )
        }
        .frame(maxWidth:.infinity , maxHeight: .infinity)
        .background(Color("Purple1"))
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
