//
//  ToDoListView.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 5.02.2024.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
       @FirestoreQuery var items: [ToDoListItem]
       private let userId: String
       
       init(userId: String) {
           self.userId = userId
           self._items = FirestoreQuery(
               collectionPath: "users/\(userId)/todos"
           )
       }
    
    var body: some View {
        
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemsView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.deleteToDo(item.id)
                            }
                        }
                           

                }
                .listStyle(PlainListStyle())
            }.padding()
            .navigationTitle("ToDos")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId:  "")
}
