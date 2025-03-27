//
//  TodoRowView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-26.
//

import SwiftUI

struct TodoRowView: View {
    @Environment(\.modelContext) var modelContext
    var todos: [Todo]
    
    var body: some View {
        List {
            ForEach(todos) { todo in
                NavigationLink(destination: TodoDetailView(todo: todo)) {
                    TodoItem(todo: todo)
                }
            }
            .onDelete {
                if let index = $0.first {
                    print("Deleting \(todos[index].name)")
                    modelContext.delete(todos[index])
                }
            }
            .onMove { indices, newOffset in
                var updated = todos
                updated.move(fromOffsets: indices, toOffset: newOffset)

                for (index, todo) in updated.enumerated() {
                    todo.order = index
                }
            }
        }
    }
}

#Preview {
    TodoRowView(todos: [Todo(name: "Milk", isFinished: false)])
}
