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
            
            VStack{
                
            }
            .frame(height: getRect().height / 3.5)
            ScrollView(.vertical,showsIndicators: false){
                
            }
            .frame(maxWidth:.infinity , maxHeight: .infinity)
            .background(
                Color.white
                // apply custom corner
                    .clipShape(CustomCorner(corner: [.topLeft,.topRight], radius: 25))
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
