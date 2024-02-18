//
//  ProfileViewViewModel.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 5.02.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ProfileViewViewModel: ObservableObject {
    init() {}
 
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
