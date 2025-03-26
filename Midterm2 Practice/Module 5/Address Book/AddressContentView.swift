//
//  AddressContentView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//

import SwiftUI
import SwiftData

struct AddressContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var addresses: [Addressbook]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(addresses) { address in
                    NavigationLink(destination: ContactView(address: address)) {
                        Text(address.name)
                    }
                }
                .onDelete {
                    if let index = $0.first {
                        modelContext.delete(addresses[index])
                    }
                }
            }
            .navigationTitle("Address Book")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        withAnimation {
                            modelContext.insert(Addressbook(name: "Kiefer", email: "Email"))
                            print("Added")
                        }
                    }
                    ) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
        }
    }
}

#Preview {
    AddressContentView()
}
