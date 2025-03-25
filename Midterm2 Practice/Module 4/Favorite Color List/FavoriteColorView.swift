//
//  FavoriteColorView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//

import SwiftUI


struct FavoriteColorView: View {
    @State var favoriteColors: [UserFavoriteColor] =  []
    
    var body: some View {
        NavigationStack {
            VStack {
                FavoriteColorRowView(favoriteColors: $favoriteColors)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add New Color", systemImage: "plus") {
                        addColor()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    private func addColor() {
        let colorOptions: [Color] = [.red, .blue, .green, .yellow, .orange, .purple]
        let newColor = UserFavoriteColor(name: "Added Color", color: colorOptions.randomElement()!)
        favoriteColors.append(newColor)
    }
}





#Preview {
    FavoriteColorView()
}
