//
//  ExerciseSix.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-04-11.
//

import SwiftUI
import SwiftData

@Model
final class Temperature {
    var value: Int
    var order: Int // Added order property for sorting
    
    init(value: Int = 0, order: Int = 0) {
        self.value = value
        self.order = order
    }
}

struct DetailTemperatureView: View {
    @Bindable var temperature: Temperature
    @State private var textFieldValue = ""
    @State private var showError = false
    
    var body: some View {
        VStack(spacing: 30) {
            Slider(
                value: Binding<Double>(
                    get: { Double(temperature.value) },
                    set: { newVal in
                        temperature.value = Int(newVal)
                        textFieldValue = "\(temperature.value)"
                        showError = false
                    }
                ),
                in: -50...50,
                step: 1
            )
            
            Stepper("Temp: \(temperature.value) °C", value: $temperature.value, in: -50...50)
                .onChange(of: temperature.value) { _, newVal in
                    textFieldValue = "\(newVal)"
                    showError = false
                }
            
            TextField("Enter temperature (−50…50)", text: $textFieldValue)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(showError ? Color.red.opacity(0.3) : Color.secondary.opacity(0.1))
                .onChange(of: textFieldValue) { _, newText in
                    if let val = Int(newText), (-50...50).contains(val) {
                        temperature.value = val
                        showError = false
                    } else {
                        showError = true
                    }
                }
            
            Spacer()
        }
        .padding()
        .onAppear {
            textFieldValue = "\(temperature.value)"
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExerciseSix: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Temperature.order) private var temperatures: [Temperature]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(temperatures) { temperature in
                    NavigationLink(destination: DetailTemperatureView(temperature: temperature)) {
                        Text("Temperature \(temperature.value) °C")
                    }
                }
                .onDelete(perform: deleteTemperatures)
                .onMove(perform: moveTemperatures)
            }
            .navigationTitle("Temperatures")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        addTemperature()
                    }
                }
            }

        }
    }
    
    private func addTemperature() {
        let highestOrder = temperatures.map { $0.order }.max() ?? -1
        let temperature = Temperature(value: 0, order: highestOrder + 1)
        modelContext.insert(temperature)
    }
    
    private func deleteTemperatures(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(temperatures[index])
        }
        updateOrderIndices()
    }
    
    private func moveTemperatures(from source: IndexSet, to destination: Int) {
        var updated = temperatures
        updated.move(fromOffsets: source, toOffset: destination)
        for (index, temp) in updated.enumerated() {
            temp.order = index
        }
    }
    
    private func updateOrderIndices() {
        for (index, temp) in temperatures.enumerated() {
            temp.order = index
        }
    }
}

#Preview {
    ExerciseSix()
}
