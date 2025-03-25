//
//  ShoppingListItemView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//


import SwiftUI
import Observation

struct ShoppingListItemView: View {
    @Binding var shoppingListItem: ShoppingList
    
    var body: some View {
        TextField("Enter Item", text: $shoppingListItem.name)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    ShoppingListItemView(shoppingListItem: .constant(ShoppingList(name: "Milk")))
}
