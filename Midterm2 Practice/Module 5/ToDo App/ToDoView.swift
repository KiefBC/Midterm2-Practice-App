//
//  ToDoView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-26.
//

import SwiftUI
import SwiftData

struct ToDoView: View {
    @Environment(\.modelContext) var modelContext
    @Query var todos: [Todo]
    
    var body: some View {
        NavigationStack {
            TodoRowView(todos: todos)
        }
        .navigationTitle("Todo App")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    withAnimation {
                        modelContext.insert(Todo(name: "New Todo"))
                    }
                }) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}



#Preview {
    ToDoView()
}
