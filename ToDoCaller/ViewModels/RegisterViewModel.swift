//
//  RegisterViewModel.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 5.02.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func registerAction() {
        guard validate() else {
            return
        }
        
         Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(userId: userId)
        }
    }
    
    private func insertUserRecord(userId: String) {
        let newUser = User(id: userId, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .setData(newUser.asDictionary())
    }
    
    func validate() -> Bool {
        guard name.trimmingCharacters(in: .whitespaces).isEmpty,
              email.trimmingCharacters(in: .whitespaces).isEmpty,
              password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return true
        }
        
        guard email.contains("@") && email.contains(".") else {
            return true
        }
        
        guard password.count >= 6 else {
            return true
        }
        
        return true
    }
    
}
