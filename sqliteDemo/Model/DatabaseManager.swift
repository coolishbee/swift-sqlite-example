//
//  DatabaseManager.swift
//  sqliteDemo
//
//  Created by james on 12/27/24.
//

import SQLite
import Foundation

class DatabaseManager {
    private var db: Connection?
    
    init() {
        if let path = Bundle.main.path(forResource: "testDB", ofType: "db") {
            do {
                db = try Connection(path, readonly: true)
                print("연결 성공")
            }catch{
                print("연결 실패 : \(error)")
            }
        }else{
            print("file not found")
        }
    }
    
    // Users 테이블에서 데이터를 읽어오는 함수
    func fetchUsers() -> [User] {
        var users: [User] = []
        let usersTable = Table("Users")
        let id = SQLite.Expression<Int>("id")
        let name = SQLite.Expression<String>("name")
        let age = SQLite.Expression<Int>("age")
        
        do {
            if let db = db {
                for user in try db.prepare(usersTable) {
                    let userData = User(id: user[id], name: user[name], age: user[age])
                    users.append(userData)
                }
            }
        } catch {
            print("데이터 읽기 실패: \(error)")
        }
        return users
    }
}

// User 모델
struct User: Identifiable, Hashable {
    var id: Int
    var name: String
    var age: Int
}
