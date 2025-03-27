//
//  NotepadView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-26.
//

import SwiftUI
import SwiftData

struct NotepadView: View {
    @Environment(\.modelContext) var modelContent
    @Query var notepad: [Notepad]
    @State var newNote: String = ""
    @State var newTitle: String = ""
    @State var lastdate: Date = Date()
    
    var body: some View {
        VStack {
            TextField("Enter Title", text: $newTitle)
                .padding()
                .multilineTextAlignment(.center)
            TextField("Name", text: $newNote)
                .frame(height: 200)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
            Text("Last Updated")
            Text(lastdate, style: .time)
                .padding()
            Button(action: {
                if let firstNote = notepad.first {
                    firstNote.content = newNote
                    firstNote.title = newTitle
                    firstNote.date = Date()
                    lastdate = firstNote.date
                }
            }, label: {
                Text("Save")
            })
        }
        .onAppear {
            if let note = notepad.first {
                newNote = note.content
                newTitle = note.title
                lastdate = note.date
            } else {
                modelContent.insert(Notepad(content: "", title: ""))
            }
        }
    }
}

#Preview {
    NotepadView()
}
