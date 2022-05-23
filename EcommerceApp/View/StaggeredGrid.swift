//
//  StaggeredGrid.swift
//  EcommerceApp
//
//  Created by Bhumika Patel on 23/05/22.
//

import SwiftUI

struct StaggeredGrid<Content: View, T: Identifiable>: View where T: Hashable{
   
    
    var content: (T)-> Content
    var list:[T]
    
    // columns
    var columns: Int
    
    // prperties
    var showIndicator: Bool
    var spacing: CGFloat
    
    init(columns: Int, showIndicator: Bool = false, spacing: CGFloat = 10, list: [T], @ViewBuilder content: @escaping (T)->Content) {
        self.content = content
        self.list = list
        self.spacing = spacing
        self.showIndicator = showIndicator
        self.columns = columns
        
    }
    // staggered grid function
     
    func setUpList()->[[T]]{
        
        // creating empty sub array..
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        
        // spiliting arrayfor vstack oriend view
        var currentIndex : Int = 0
        
        for object in list{
            gridArray[currentIndex].append(object)
            
            // increasing index counting
            // and resetting overbounds the column counts
            
            if currentIndex == (columns - 1){
                currentIndex = 0
            } else{
                currentIndex += 1
            }
        }
        return gridArray
    }
    
    var body: some View {
       
        HStack(alignment: .top, spacing: 20){
            ForEach(setUpList(),id:\.self){ columnsData in
                LazyVStack(spacing: spacing){
                    ForEach(columnsData){object in
                        content(object)
                    }
                }
            }
        }
        // only vertical padding
        //horizontal padding
        .padding(.vertical)
        
    
    }
}

struct StaggeredGrid_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
  
