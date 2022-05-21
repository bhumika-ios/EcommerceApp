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
    
    //Login call
    func Login(){
        // action
    }
    
    func Register(){
        // action
    }
    
    func ForgotPassword(){
       //action
    }
}
