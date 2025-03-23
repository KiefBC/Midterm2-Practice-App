//
//  LogosView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-23.
//

import SwiftUI

struct LogoRowView: View {
    @Binding var logo: Logo
    
    var body: some View {
        HStack {
            Image(systemName: logo.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding(.horizontal, 1)
                .foregroundColor(logo.color)
            Spacer()
            Text(logo.userTitle)
                .foregroundColor(.blue)
            Spacer()
        }
    }
}

#Preview {
    let logosName: [String] = ["xbox.logo"]
    ForEach(logosName, id: \.self) { logo in
        // .constant is used to pass a constant value to a binding for a preview
        LogoRowView(logo: .constant(Logo(name: logo, color: .red)))
    }
}
