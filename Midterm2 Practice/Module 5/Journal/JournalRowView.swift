//
//  JournalRowView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-26.
//

import SwiftUI
import SwiftData

struct JournalRowView: View {
    @Environment(\.modelContext) var journalContext
    var journalEntries: [Journal]
    
    var body: some View {
        List {
            ForEach(journalEntries) { e in
                JournalEntryView(entry: e)
            }
            .onDelete {
                if let index = $0.first {
                    journalContext.delete(journalEntries[index])
                }
            }
        }
    }
}

#Preview {
//    JournalRowView(journalEntries: Journal(date: Date(timeIntervalSinceReferenceDate: 118800), event: "This is a journal entry."))
}
