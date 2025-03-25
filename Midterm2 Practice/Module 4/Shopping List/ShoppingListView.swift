//
//  ShoppingListView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//

import SwiftUI
import Observation

struct ShoppingListView: View {
    @State var shoppingListItems: [ShoppingList] = []
    @State var count: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                ShoppingListDetailView(shoppingListItems: $shoppingListItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }
    
    func addItem() {
        shoppingListItems.append(ShoppingList(name: "New Shopping Item, Quantity: \(count)"))
        count += 1
    }
}

#Preview {
    ShoppingListView()
}
