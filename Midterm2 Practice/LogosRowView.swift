//
//  LogosRowView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-23.
//

import SwiftUI

struct LogosRowView: View {
    @Binding var logos: Logos
    
    var body: some View {
        VStack {
            Image(systemName: logos.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            
            TextField("Name", text: $logos.name)
                .multilineTextAlignment(.center)
            
            Text("Date Added: \(logos.date, formatter: dateFormatter)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
}

#Preview {
    let logosName: [String] = ["xbox.logo"]
    ForEach(logosName, id: \.self) { logo in
        LogosRowView(logos: .constant(Logos(name: logo)))
    }
}
