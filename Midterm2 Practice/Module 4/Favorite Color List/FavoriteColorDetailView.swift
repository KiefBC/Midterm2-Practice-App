//
//  FavoriteColorDetailView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//


import SwiftUI

struct FavoriteColorDetailView: View {
    @Binding var userColor: UserFavoriteColor
    
    var body: some View {
        VStack {
            Text("Your Favorite Color is \(userColor.name)")
                .foregroundStyle(userColor.color)
                .multilineTextAlignment(.center)
            TextField("Set A New Name", text: $userColor.name)
                .multilineTextAlignment(.center)
            ColorPicker("Set Color", selection: $userColor.color)
                .labelsHidden()
        }
    }
}

#Preview {
    FavoriteColorDetailView(userColor: .constant(UserFavoriteColor(name: "Kiefer", color: .blue)))
}
