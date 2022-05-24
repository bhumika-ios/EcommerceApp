//
//  ProfileScreen.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 24/05/22.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    Text("My Profile")
                        .font(.custom(customFont, size: 28).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(spacing: 15) {
                        
                        Image("Profiledp")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .offset(y: -30)
                            .padding(.bottom,-30)
                        
                        Text("Neha Patel")
                            .font(.custom(customFont, size: 16))
                            .fontWeight(.semibold)
                        HStack(alignment: .top, spacing: 10) {
                            
                            Image(systemName: "location.north.circle.fill")
                                .foregroundColor(.gray)
                                .rotationEffect(.init(degrees: 180))
                            Text("Address: Gujarat Gas circle,\n Adajan, \nSurat-395005")
                                .font(.custom(customFont, size: 15))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.horizontal,.bottom])
                    .background(
                        Color.white.cornerRadius(12)
                        
                    )
                    .padding()
                    .padding(.top,40)
                    
                    // custom navigation link
                    CustomNavigationLink(title: "Edit Profile"){
                        Text("")
                            .navigationTitle("Edit Profile")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("LightGray").ignoresSafeArea())
                    }
                    CustomNavigationLink(title: "Shopping Address"){
                        Text("")
                            .navigationTitle("Shopping Address")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("LightGray").ignoresSafeArea())
                    }
                    CustomNavigationLink(title: "Order History"){
                        Text("")
                            .navigationTitle("Order History")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("LightGray").ignoresSafeArea())
                    }
                    CustomNavigationLink(title: "Cards"){
                        Text("")
                            .navigationTitle("Cards")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("LightGray").ignoresSafeArea())
                    }
                    CustomNavigationLink(title: "Notification"){
                        Text("")
                            .navigationTitle("Notification")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("LightGray").ignoresSafeArea())
                    }
                }
                .padding(.horizontal,22)
                .padding(.vertical,20)
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
    func CustomNavigationLink<Detail: View>(title: String, @ViewBuilder content: @escaping ()->Detail)->some View{
        
        NavigationLink{
            content()
        } label: {
            HStack{
                
                Text(title)
                    .font(.custom(customFont, size: 17))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
            .background(
                Color.white.cornerRadius(12)
                
            )
            .padding(.horizontal)
            .padding(.top,10)
        }
    }
                            
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
