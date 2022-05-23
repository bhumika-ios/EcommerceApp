//
//  SearchView.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 23/05/22.
//

import SwiftUI

struct SearchView: View {
    var animation: Namespace.ID
    
    @EnvironmentObject var homeData: HomeViewModel
    //Activating text field with help of focusStatus.
    @FocusState var startTF: Bool
    var body: some View {
        VStack{
            //SearchBar
            HStack(spacing: 15){
                //close button
                Button{
                    withAnimation{
                        homeData.searchActive = false
                    }
                }label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(Color.black.opacity(0.7))
                }
                //searchbar
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    // need to separate view for search bar
                    TextField("Search", text: $homeData.searchText)
                        .focused($startTF)
                        .textCase(.lowercase)
                        .disableAutocorrection(true)
                      
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                        Capsule()
                            .strokeBorder(Color("Purple"),lineWidth: 1.5)
                        
                )
                .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                .padding(.trailing, 20)
            }
            .padding([.horizontal])
            .padding(.top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
        Color("LightGray").ignoresSafeArea()
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                startTF = true
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
    HomeTabScreen()
    }
}
