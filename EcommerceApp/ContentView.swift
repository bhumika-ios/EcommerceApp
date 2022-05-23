//
//  ContentView.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 19/05/22.
//

import SwiftUI

struct ContentView: View {
    // Log Status
    @AppStorage("log_Status") var log_Status: Bool = false
    var body: some View {
       
        Group{
            if log_Status{
                MainScreen()
            }else{
                OnBoardingScreen()
            }
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
