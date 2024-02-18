//
//  ContentView.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 4.02.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()

    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
            
        } else {
            NavigationView {
                LoginView()
            }
        }
        
       
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem { Label("ToDos", systemImage: "house") }
            
            ProfileView()
                .tabItem { Label("Account", systemImage: "person.circle") }
        }.tint(.green)
    }
}

#Preview {
    MainView()
}
