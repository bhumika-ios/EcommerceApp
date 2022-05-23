//
//  LoginScreenModel.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 19/05/22.
//

import SwiftUI

class LoginScreenModel: ObservableObject {
    // Login Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    @Published var LoginScreen: Bool = false
    
    // Register Properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    //log status.
    @AppStorage("log_Status") var log_Status: Bool = false
    //Login call
    func Login(){
        // action
        withAnimation{
            log_Status = true
        }
    }
    
    func Register(){
        // action
        withAnimation{
            log_Status = true
        }
    }
    
    func ForgotPassword(){
       //action
    }
}
