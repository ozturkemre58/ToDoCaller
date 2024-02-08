//
//  User.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 5.02.2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
