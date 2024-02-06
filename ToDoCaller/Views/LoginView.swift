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
            HeaderView(title: "ToDoCaller", subtitle: "Welcome", angle: -15, bgColor: .orange)
            
            //BodyView
            Form {
                TextField("Email Address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TLButton(title: "Log In", bgColor: .blue) {
                    print("LOG IN")
                }.padding()
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
