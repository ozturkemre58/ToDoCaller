//
//  LoginView.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 5.02.2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        
        @State var email = ""
        @State var password = ""
        
        VStack {
            //HeaderView
            HeaderView()
            
            //BodyView
            Form {
                TextField("Email Address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                Button {
                    
                } label: {
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.blue)
                        
                        Text("Log In")
                            .foregroundStyle(Color.white)
                            .bold()
                    }.padding()
                }
            }
            
            //FooterView
            VStack {
                Text("New Account Here ?")
                NavigationLink("Create An Account", destination: RegisterView())
            }
            .padding(.bottom, 50)
            
            Spacer()
        }
    }
}


#Preview {
    LoginView()
}
