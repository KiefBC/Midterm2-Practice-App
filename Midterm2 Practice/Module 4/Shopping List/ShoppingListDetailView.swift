//
//  ShoppingListDetailView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//


import SwiftUI
import Observation

struct ShoppingListDetailView: View {
    @Binding var shoppingListItems: [ShoppingList]
    
    var body: some View {
            List {
                ForEach($shoppingListItems) { $item in
                    NavigationLink(destination: ShoppingListItemView(shoppingListItem: $item)) {
                        ShoppingListRowView(shoppingListItem: $item)
                    }
                }
                .onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
            }
    }
    
    private func deleteItem(at offset: IndexSet) {
        shoppingListItems.remove(atOffsets: offset)
    }
    
    private func moveItem(from source: IndexSet, to destination: Int) {
        shoppingListItems.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ShoppingListDetailView(shoppingListItems: .constant([ShoppingList(name: "Milk"), ShoppingList(name: "Eggs"), ShoppingList(name: "Bread")]))
}
