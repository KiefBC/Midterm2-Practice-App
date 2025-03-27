//
//  StarReviewRating.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-27.
//

import SwiftUI

struct StarRatingView: View {
    @Bindable var todo: Todo

    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: index <= todo.rating ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        todo.rating = index
                    }
            }
        }
    }
}

#Preview {
    StarRatingView(todo: Todo(name: "Milk", isFinished: false))
}
