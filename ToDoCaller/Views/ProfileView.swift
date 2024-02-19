//
//  ProfileView.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 5.02.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                   profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .padding(.top, 50)
            .onAppear {
                viewModel.fetchUser()
            }
            
            
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.green)
            .frame(width: 125, height: 125)
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }.padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }.padding()
            
            Spacer()
            
            HStack {
                Spacer()
                TLButton(title: "Log Out", bgColor: .green) {
                    viewModel.logOut()
                }
                .frame(width: 150, height: 75)
                Spacer()
            }.padding(.bottom, 20)
        }
        .padding(.top, 50)
    }
}

#Preview {
    ProfileView()
}
