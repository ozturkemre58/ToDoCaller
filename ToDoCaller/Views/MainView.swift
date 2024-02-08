//
//  ContentView.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 4.02.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        @StateObject var viewModel = MainViewViewModel()
        
        if viewModel.isSignedIn,   !viewModel.currentUserId.isEmpty {
            //signed in
            ToDoListView()
        } else {
            NavigationView {
                LoginView()
            }
            
            
        }
        
       
    }
}

#Preview {
    MainView()
}
