//
//  AppTitleView.swift
//  SeptaMobile
//
//  Created by Mike Chirico on 12/22/19.
//  Copyright © 2019 Mike Chirico. All rights reserved.
//

import SwiftUI

struct AppTitleView: View {
    
    var Title: String
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                
                Text("FirebaseLogin").font(.system(size: 24)).fontWeight(.ultraLight).frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                
                Text(Title) .font(.system(size: 72)).fontWeight(.ultraLight).frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                
            }
        }.padding(.top, 30).padding(.leading, 10).background(Color.init(red: 0.9, green: 0.9, blue: 0.9)).shadow(radius:21)
    }
}
struct AppTitleView_Previews: PreviewProvider {
    static var previews: some View {
        AppTitleView(Title: "Example")
    }
}
