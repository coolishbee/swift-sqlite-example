//
//  UsersViewModel.swift
//  sqliteDemo
//
//  Created by james on 12/27/24.
//

import SwiftUI

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []    
    
    private let databaseManager = DatabaseManager()

    func loadUsers() {
        users = databaseManager.fetchUsers()
    }
    
}
