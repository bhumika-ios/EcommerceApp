//
//  MoreProductView.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 23/05/22.
//

import SwiftUI

struct MoreProductView: View {
    var body: some View {
        VStack{
            Text("More Products")
                .font(.custom(customFont, size: 24).bold())
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color("LightGray").ignoresSafeArea())
    }
}

struct MoreProductView_Previews: PreviewProvider {
    static var previews: some View {
        MoreProductView()
    }
}
