//
//  ToDoCallerApp.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 4.02.2024.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoCallerApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
