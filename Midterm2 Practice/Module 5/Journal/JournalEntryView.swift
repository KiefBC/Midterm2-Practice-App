//
//  JournalEntryView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-26.
//

import SwiftUI

struct JournalEntryView: View {
    @Bindable var entry: Journal
    
    var body: some View {
        VStack {
            Text(entry.date, style: .date)
                .font(.subheadline)
                .foregroundColor(.blue)
            DatePicker("Event Date Change?", selection: $entry.date, displayedComponents: .date)
                .labelsHidden()
            TextField("", text: $entry.event)
                .font(.headline)
                .foregroundColor(.green)
                .multilineTextAlignment(.center)

        }
    }
}

#Preview {
    JournalEntryView(entry: Journal(date: Date(timeIntervalSinceReferenceDate: 118800), event: "This is a journal entry."))
}
