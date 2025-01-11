//
//  MainView.swift
//  sqliteDemo
//
//  Created by james on 12/28/24.
//

import SwiftUI

struct MainView: View {
    
    enum Section: String {
        case products
    }
    enum Detail {
        case product(User)
    }
    
    @State private var section : Section? = .products
    @State private var products : [ User ] = []
    @State private var selectedProductID : User.ID?
    
    
    private var selectedProduct : User? {
        selectedProductID.flatMap { id in products.first(where: { $0.id == id })}
    }
    
    private func updateSavedProduct(_ product: User) {
        guard let idx = products.firstIndex(where: { $0.id == product.id }) else {
            return // not in the list?
        }
        products[idx] = product
    }
    
    var body: some View {
        NavigationSplitView(
            
            sidebar: {
                Sidebar(section: $section)
            },
            
            content: {
                switch section {
                case .products:
                    ProductsList(products: $products,
                                 selectedProduct: $selectedProductID)
                    .frame(minWidth: 274)
                    
                case .none:
                    Text("No section is selected")
                }
            },
            
            detail: {
                if let product = selectedProduct {
                    ProductPage(snapshot: product, onSave: updateSavedProduct)
                }
                else {
                    Text("Nothing Selected")
                        .font(.title)
                        .foregroundColor(.accentColor)
                }
            }
        )
    }
}
