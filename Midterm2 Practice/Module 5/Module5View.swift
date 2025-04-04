//
//  Module5View.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//

import SwiftUI

struct Module5View: View {
    var body: some View {
        NavigationStack {
            HStack {
                NavigationLink(destination: AddressContentView()) {
                    Text("Address Book")
                        .padding()
                }
                NavigationLink(destination: JournalContentView()) {
                    Text("Journal Book")
                        .padding()
                }
                NavigationLink(destination: ToDoView()) {
                    Text("To Do List")
                        .padding()
                }
                NavigationLink(destination: NotepadView()) {
                    Text("Notepad")
                        .padding()
                }
                NavigationLink(destination: PickerContentView()) {
                    Text("Quiz")
                        .padding()
                }
            }
            
            TabView {
                Tab("Address Book", systemImage: "book.fill") {
                    AddressContentView()
                }
                Tab("Journal Book", systemImage: "book.fill") {
                    JournalContentView()
                }
            }
        }
    }
}

#Preview {
    Module5View()
}
