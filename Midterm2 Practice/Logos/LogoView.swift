//
//  LogosRowView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-23.
//

import SwiftUI

struct LogoView: View {
    @Binding var logo: Logo
    
    var body: some View {
        VStack {
            Image(systemName: logo.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding(.bottom)
                .foregroundColor(logo.color)
            
            TextField("Name", text: $logo.userTitle)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            Text("Date Added: \(logo.date, formatter: dateFormatter)")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.bottom)
            
            Button("Non-Working") {
                print("Non-Working")
            }
            
            HStack {
                DatePicker(selection: $logo.date, displayedComponents: .date, label: {})
                    .padding(.horizontal, 200)
            }
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
        LogoRowView(logo: .constant(Logo(name: logo, color: .red)))
    }
}
