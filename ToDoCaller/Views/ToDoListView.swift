//
//  ToDoListView.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 5.02.2024.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                
            }
            .navigationTitle("ToDos")
            .toolbar {
                Button {
                    //action
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ToDoListView(userId:  "")
}
