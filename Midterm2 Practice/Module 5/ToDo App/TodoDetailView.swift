//
//  TodoDetailView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-26.
//

import SwiftUI

struct TodoDetailView: View {
    @Bindable var todo: Todo
    
    var body: some View {
        VStack {
            TextField("Enter a new todo", text: $todo.name)
                .multilineTextAlignment(.center)
                .padding()
            Text("Is this item finished? \(todo.isFinished ? "Yes" : "No")")
                .padding()
            Toggle("Finished?", isOn: $todo.isFinished)
        }
        .background(Color.gray.opacity(0.2))
    }
}

#Preview {
    TodoDetailView(todo: Todo(name: "Build a SwiftUI App"))
}
