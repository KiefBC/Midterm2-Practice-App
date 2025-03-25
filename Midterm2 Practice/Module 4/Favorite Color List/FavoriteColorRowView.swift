//
//  FavoriteColorListView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//


import SwiftUI

struct FavoriteColorRowView: View {
    @Binding var favoriteColors: [UserFavoriteColor]
    
    var body: some View {
        List {
            ForEach($favoriteColors) { $favoriteColor in
                NavigationLink(destination: FavoriteColorDetailView(userColor: $favoriteColor)) {
                    FavoriteColorRowItemView(favoriteColor: $favoriteColor)
                }
            }
            .onDelete(perform: deleteItem)
            .onMove(perform: moveItem)
        }
    }
    
    func deleteItem(at offset: IndexSet) {
        favoriteColors.remove(atOffsets: offset)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        favoriteColors.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    FavoriteColorView(favoriteColors: ([UserFavoriteColor(name: "Kiefer", color: Color.red), UserFavoriteColor(name: "Hay", color: Color.blue), UserFavoriteColor(name: "Kiefer Hay", color: Color.green)]))
}
