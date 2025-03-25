//
//  ShoppingListRowView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//


import SwiftUI
import Observation

struct ShoppingListRowView: View {
    @Binding var shoppingListItem: ShoppingList
    
    var body: some View {
        HStack {
            Image(systemName: "cart")
                .foregroundColor(.blue)
            Spacer()
            Text(shoppingListItem.name)
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    ShoppingListRowView(shoppingListItem: .constant(ShoppingList(name: "Milk")))
}
