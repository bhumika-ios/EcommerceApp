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
                    .background(
                        
                        ZStack{
                            //Gradient Circle
                            LinearGradient(colors: [
                            Color("Lcircle"),
                            Color("Lcircle")
                                .opacity(0.8),
                            Color("Purple1")
                            ], startPoint: .top, endPoint: .bottom)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding(.trailing)
                            .offset(y: -25)
                            .ignoresSafeArea()
                            
                            Circle()
                                .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                                .frame(width: 30, height: 30)
                                .blur(radius: 2 )
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                .padding(30)
                            
                            Circle()
                                .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                                .frame(width: 23, height: 23)
                                .blur(radius: 2)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                .padding(.leading,30)
                            
                        }
                    )
 
           
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
