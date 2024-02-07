//
//  LoginView.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 5.02.2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
      @StateObject var viewModel = LoginViewViewModel()
        
        VStack {
            //HeaderView
            HeaderView(title: "ToDoCaller", subtitle: "Welcome", angle: -15, bgColor: .orange)
            
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundStyle(Color.red)
            }
            //BodyView
            Form {
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TLButton(title: "Log In", bgColor: .blue) {
                    viewModel.login()
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
