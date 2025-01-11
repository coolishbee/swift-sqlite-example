//
//  ProductsList.swift
//  sqliteDemo
//
//  Created by james on 12/28/24.
//

import SwiftUI

struct ProductsList: View {
    
    @StateObject private var viewModel = UsersViewModel()
    
    @Binding var products : [ User ]
    @Binding var selectedProduct : User.ID?
    
    @State private var searchString = ""
    
    var body: some View {
        List(products, selection: $selectedProduct) { product in
            ProductCell(product: product)
        }
        .searchable(text: $searchString)
        .task(id: searchString) {
            let searchString = searchString
            print("search keyword : \(searchString)")
            
            products = viewModel.users;
                            
            if selectedProduct == nil, let product = products.first {
                selectedProduct = product.id
            }
        }
        .navigationTitle("Users")
        .onAppear {
            viewModel.loadUsers()
        }
    }
}
