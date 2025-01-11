//
//  ContentView.swift
//  sqliteDemo
//
//  Created by james on 12/27/24.
//

import SwiftUI

struct ContentView: View {
    //@StateObject private var viewModel = UsersViewModel()
    
    var body: some View {
//        NavigationView {
//            List(viewModel.users) { user in
//                VStack(alignment: .leading) {
//                    Text(user.name)
//                        .font(.headline)
//                    Text("Age: \(user.age)")
//                        .font(.subheadline)
//                }
//            }
//            .navigationTitle("Users")
//            .onAppear {
//                viewModel.loadUsers()
//            }
//        }
        MainView()
    }
}

#Preview {
    ContentView()
}
