//
//  ProductPage.swift
//  sqliteDemo
//
//  Created by james on 12/28/24.
//

import SwiftUI

@MainActor
struct ProductPage: View {
    
    /// The database is passed down by the Application struct in the environment.
    //@Environment(\.database) private var database
    
    /// The snapshot is the current value that got fetched from the database
    let snapshot : User
    
    /// This is used to tell the list about a change we did. I.e. a save.
    /// In a real app there should be more app structure around this, but that
    /// won't be "Lighter", but "Heavier" (stay tuned™️).
    let onSave : ( User ) -> Void
    
    /// If we allow editing, we can keep a copy of the snapshot for that purpose.
    @State private var product  : User = User(id: 0, name: "", age: 0)
    
    //@State private var supplier : Supplier?
    //@State private var category : NorthwindCategory?
    
    /// Since SQLite records are by definition equatable, we can just compare the
    /// full record for changes.
    private var hasChanges : Bool {
        return true
    }
    
    func setup() async {
//        do {
//            let product  = product  // for strict concurrency
//            let database = database
//            async let supplier = database.suppliers .find(for: product)
//            async let category = database.categories.find(for: product)
//            ( self.supplier, self.category ) = try await ( supplier, category )
//        }
//        catch {
//            print("ERROR: Failed to fetch a relationship.")
//        }
    }
    
    /// Revert changes
    private func revert() {
        product = snapshot
    }
    
    private func save() async {
//        do {
//            
//            let product  = product
//            let supplier = supplier
//            try await database.transaction { tx in
//                
//                try tx.update(product)
//                
//                // we always save the supplier, demo only.
//                if let supplier = supplier {
//                    try tx.update(supplier)
//                }
//            }
//            
//            await MainActor.run {
//                // Tell the parent view that the record got modified, so that the
//                // List can be updated.
//                self.onSave(product)
//            }
//        }
//        catch {
//            print("ERROR: failed to save:", error)
//        }
    }
    
    var body: some View {
        Group {
            macOS
        }
        .task { await setup() }
        .onChange(of: snapshot) { oldValue, newValue in
            //print("Old value: \(oldValue), New value: \(newValue)")
            product = newValue
        }
        .onAppear {
            // If the view loads, make a copy of the fetched record for editing.
            product = snapshot
        }
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button(action: revert) {
                    Label("revert", systemImage: "arrow.counterclockwise")
                }
                .keyboardShortcut("r", modifiers: [ .command ])
                .help("Revert changes made to the record.")
                .disabled(!hasChanges)
            }
            ToolbarItem(placement: .confirmationAction) {
                Button(action: { Task { await self.save() } }) {
                    Label("save", systemImage: "checkmark.circle")
                }
                .keyboardShortcut("s", modifiers: [ .command ])
                .help("Save changes made to the record.")
                .disabled(!hasChanges)
            }
        }
    }
    
    
    
    private var macOS: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack {
                Spacer()
                Text(product.name)
                    .font(.title)
                Spacer()
            }
            .padding()
            .background(alignment: .trailing) {
                Text("Edited")
                    .font(.footnote)
                    .foregroundColor(.red)
                    .opacity(hasChanges ? 1.0 : 0.0)
                    .padding()
            }
            
            Divider()
            
            ScrollView {
                Form {
                    ProductForm(product: $product)
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

