//
//  LoginView.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 5.02.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        VStack {
            //HeaderView
            HeaderView(title: "ToDoCaller", subtitle: "Welcome", angle: -15, bgColor: .orange)
            
            //BodyView
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(Color.red)
                }
                
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
            }.offset(y: -50)
            
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
