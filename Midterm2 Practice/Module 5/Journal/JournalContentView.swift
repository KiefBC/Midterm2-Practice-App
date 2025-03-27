//
//  JournalContentView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-26.
//

import SwiftUI
import SwiftData

struct JournalContentView: View {
    @Query private var journalEntries: [Journal]
    @Environment(\.modelContext) var journalContext
    
    var body: some View {
        NavigationStack {
            JournalRowView(journalEntries: journalEntries)
        }
        .navigationTitle("Journal App")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(
                    action: {
                        withAnimation {
                            journalContext.insert(Journal(date: Date(), event: "New Entry"))
                        }
                    }) {
                        Image(systemName: "plus")
                    }
            }
        }
    }
}

#Preview {
    JournalContentView()
}
