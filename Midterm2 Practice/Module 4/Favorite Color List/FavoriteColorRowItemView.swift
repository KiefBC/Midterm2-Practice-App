//
//  FavoriteColorRowItemView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//

import SwiftUI

struct FavoriteColorRowItemView: View {
    @Binding var favoriteColor: UserFavoriteColor
    
    var body: some View {
        HStack {
            Image(systemName: "heart.fill")
            TextField("Change Name", text: $favoriteColor.name)
                .labelsHidden()
            Spacer()
            ColorPicker("Favorite Color", selection: $favoriteColor.color)
                .labelsHidden()
        }
        .foregroundColor(favoriteColor.color)
    }
}

#Preview {
    FavoriteColorRowItemView(favoriteColor: .constant(UserFavoriteColor(name: "Red", color: .red)))
}
