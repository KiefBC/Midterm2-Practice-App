//
//  FullLogoView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-23.
//

import SwiftUI

struct FullLogoView: View {
    @Binding var logos: [Logo]
    
    var body: some View {
        List {
            ForEach($logos) { $logo in
                NavigationLink(destination: LogoView(logo: $logo)) {
                    LogoRowView(logo: $logo)
                }
            }
            .onDelete(perform: deleteLadybugs)
            .onMove(perform: moveLadybugs)
        }
    }
    
    /// Deletes the ladybugs at the specified offsets
    private func deleteLadybugs(at offsets: IndexSet) {
        logos.remove(atOffsets: offsets)
    }
    
    ///  Moves the ladybugs from the source to the destination
    private func moveLadybugs(from source: IndexSet, to destination: Int) {
        logos.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    FullLogoView(logos: .constant([Logo(name: "xbox.logo", color: Color.red), Logo(name: "playstation.logo", color: Color.blue), Logo(name: "apple.logo", color: Color.green)]))
}
