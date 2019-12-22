//
//  SignUpView.swift
//  SeptaMobile
//
//  Created by Mike Chirico on 12/22/19.
//  Copyright © 2019 Mike Chirico. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth



struct SignUpView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var emailAddress: String = ""
    @State var password: String = ""
    @State var agreeCheck: Bool = false
    @State var errorText: String = ""
    @State private var showAlert = false
    
    var alert: Alert {
        
        Alert(title: Text("Verify your Email ID"), message: Text("Please click the link in the verification email sent to you"), dismissButton: .default(Text("Dismiss")){
            
            self.presentationMode.wrappedValue.dismiss()
            self.emailAddress = ""
            self.password = ""
            self.agreeCheck = false
            self.errorText = ""
            
            })
    }
    
    var body: some View {
        
        VStack {
            
            AppTitleView(Title: "Sign Up")
            
            VStack(spacing: 10) {
                
                
                Text("Email").font(.title).fontWeight(.thin).frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                
                TextField("user@domain.com", text: $emailAddress).textContentType(.emailAddress)
                
                Text("Password").font(.title).fontWeight(.thin)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                
                SecureField("Enter a password", text: $password)
                
                Toggle(isOn: $agreeCheck)
                {
                    Text("Agree to the Terms and Condition").fontWeight(.thin)
                    
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                
                Button(action: {
                    
                    if(self.agreeCheck){
                        print("Printing outputs" + self.emailAddress, self.password  )
                        self.sayHelloWorld(email:self.emailAddress, password:self.password)
                    }
                    else{
                        self.errorText = "Please Agree to the Terms and Condition"
                    }
                }) {
                    
                    Text("Sign Up")
                    
                }
                
                Text(errorText).frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                
                Spacer()
                
            }.padding(10)
            
        }.edgesIgnoringSafeArea(.top).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading).background(Color.white)
            
            
            .alert(isPresented: $showAlert, content: { self.alert })
        
    }
    
    
    func sayHelloWorld(email: String, password: String) {
        
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            guard let user = authResult?.user, error == nil else {
                
                let errorText: String  = error?.localizedDescription ?? "unknown error"
                self.errorText = errorText
                return
            }
            
            Auth.auth().currentUser?.sendEmailVerification { (error) in
                if let error = error {
                    self.errorText = error.localizedDescription
                    return
                }
                self.showAlert.toggle()
                
            }
            
            print("\(user.email!) created")
            
        }
        
        
    }
    
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
