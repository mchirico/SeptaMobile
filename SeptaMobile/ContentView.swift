//
//  ContentView.swift
//  SeptaMobile
//
//  Created by Mike Chirico on 12/22/19.
//  Copyright © 2019 Mike Chirico. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    var body: some View {
        
        
        VStack{
            
            
            AppTitleView(Title: "SeptaMoble")
            
            Spacer()
            
            Text("Hello World!")
            
            Spacer()
            
        }.edgesIgnoringSafeArea(.top).background(Color.white)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
