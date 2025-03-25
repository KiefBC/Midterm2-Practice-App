//
//  LogosRowView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-23.
//

import SwiftUI

struct LogoView: View {
    @Binding var logo: Logo
    
    /// Tracks whether we show the ColorPicker or not
    @State var colorChangeShow: Bool = false

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

            Button(colorChangeShow ? "Hide Color" : "Change Color?") {
                colorChangeShow.toggle()
            }
            .padding(.bottom)
            
            DatePicker(selection: $logo.date, displayedComponents: .date, label: {})
                .padding(.horizontal, 200)

            if colorChangeShow {
                Group {
                    ColorPicker("", selection: $logo.color, supportsOpacity: true)
                        .labelsHidden()
                        .padding(.bottom)
                    Text("Color: \(logo.color.description)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
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
    LogoView(logo: .constant(Logo(name: "xbox.logo", color: .red)))
}
