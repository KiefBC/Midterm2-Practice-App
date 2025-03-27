//
//  todoItem.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-26.
//
import SwiftUI

struct TodoItem: View {
    @Bindable var todo: Todo
    
    var body: some View {
        HStack {
            Text(todo.name)
            Spacer()
            Toggle("", isOn: $todo.isFinished)
                .labelsHidden()
            Spacer()
            Text("Job Completed? \(todo.isFinished ? "✅" : "❌")")
            StarRatingView(todo: todo)
        }
        .toggleStyle(.switch)
    }
}
