//
//  Midterm2_PracticeApp.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-22.
//

import SwiftUI
import SwiftData

@main
struct Midterm2_PracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Addressbook.self, Journal.self, Todo.self, Notepad.self, Temperature.self])
    }
}
