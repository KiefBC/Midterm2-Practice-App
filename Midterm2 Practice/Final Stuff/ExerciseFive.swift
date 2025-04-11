//
//  ExerciseFive.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-04-11.
//

import SwiftUI

struct ExerciseFive: View {
    @State private var globeColor = Color.blue
    @State private var showPicker = false
    
    var body: some View {
        VStack(spacing: 40) {
            
            HStack {
                Spacer()
                Button {
                    showPicker.toggle()
                } label: {
                    Image(systemName: "paintbrush")
                        .font(.title)
                        .padding()
                }
            }
            
            if showPicker {
                ColorPicker("", selection: $globeColor)
                    .labelsHidden()
                    .padding()
            }
            
            Spacer()
            Image(systemName: "globe")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(globeColor)
            
            Spacer()
        }
    }
}

#Preview {
    ExerciseFive()
}
