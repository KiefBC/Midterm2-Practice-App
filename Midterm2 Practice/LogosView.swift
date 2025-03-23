//
//  LogosView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-23.
//

import SwiftUI

struct LogosView: View {
    @Binding var logos: Logos
    
    var body: some View {
        HStack {
            Image(systemName: logos.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding()
        }
    }
}

#Preview {
    let logosName: [String] = ["xbox.logo", "playstation.logo", "apple.logo"]
    ForEach(logosName, id: \.self) { logo in
        // .constant is used to pass a constant value to a binding for a preview
        LogosView(logos: .constant(Logos(name: logo)))
    }
}
