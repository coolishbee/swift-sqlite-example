//
//  ProductCell.swift
//  sqliteDemo
//
//  Created by james on 12/28/24.
//

import SwiftUI

struct ProductCell: View {
    
    let product : User
    
    // Incorrectly marked NULLable in Northwind
    //private var unitsInStock : Int { product.unitsInStock ?? 0 }
    
    var body: some View {
        Label(
            title: {
                VStack(alignment: .leading) {
                    Text(verbatim: product.name)
                        .font(.headline)
                    
                    detailText
                }
            },
            icon: { Image(systemName: "p.circle") }
        )
    }
    
    var detailText : Text {
        let text = Text(product.age, format: .currency(code: "USD"))
        
        //    if unitsInStock > 0 {
        //      text = text + Text(", \(unitsInStock) in stock")
        //    }
        //    else {
        //      text = text + Text(", ")
        //      text = text + Text("out of stock").foregroundColor(.red)
        //      if let ordered = product.unitsOnOrder, ordered > 0 {
        //        text = text + Text(", ordered \(ordered)")
        //      }
        //    }
        //
        //    if product.discontinued != "0" {
        //      text = text + Text(", ")
        //      text = text + Text("discontinued").foregroundColor(.red)
        //    }
        return text
    }
}
