//
//  SwiftUIView.swift
//  Fridge
//
//  Created by Ivan on 14.08.2025.
//

import SwiftData
import SwiftUI

struct HomeScreen: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var products: [Product]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(products) { product in
                    NavigationLink {
                        Text("\(product.name)")
                    } label: {
                        Text(product.name)
                    }
                }
                .onDelete(perform: deleteProducts)
            }
            .toolbar {
                ToolbarItem {
                    Button(action: addProduct) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a product")
        }
    }

    private func addProduct() {
        withAnimation {
            let newProduct = Product(name: "New Product")
            modelContext.insert(newProduct)
        }
    }

    private func deleteProducts(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(products[index])
            }
        }
    }
}
