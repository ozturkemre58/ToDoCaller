//
//  ToDoListViewModel.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 5.02.2024.
//

import Foundation
import FirebaseFirestore
  
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    
    
    init(userId: String) {
        self.userId = userId
    }
    
    func deleteToDo(_ id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
