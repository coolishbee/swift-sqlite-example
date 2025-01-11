//
//  Sidebar.swift
//  sqliteDemo
//
//  Created by james on 12/28/24.
//

import SwiftUI

extension MainView {
    
    struct Sidebar: View {
        
        @Binding var section : Section?
        
        var body: some View {
            List(selection: $section) {
                Text("SQLiteDB")
                    .font(.title2)
                    .tag(Section.products)
            }
            .navigationTitle("Database")
        }
    }
}
