//
//  PlaceholderElements.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-04-13.
//


//  1.Buttons
import SwiftUI


struct PlaceholderElements: View {
    // For buttons
    @State private var isSignedIn = false
    @State private var message = "You are currently signed out."
    
    // For Color Picker
    @State private var bgColor =
    Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    
    // Date Picker
    @State private var date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy/MM/dd"
        return formatter
    }
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(
            year: 2021,
            month: 12,
            day: 31,
            hour: 23,
            minute: 59,
            second: 59
        )
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        VStack {
            
            // ******************************************
            
            // 1. Basic Text Button
            Button("Tap me") {
                print("Sign In")
            }
            
            // 2. Image Only Button
            Button(action: {
                print("Globe tapped")
            }) {
                Image(systemName: "globe")
            }
            
            // 3. Text + Image Button
            Button(action: {
                print("Text + Image tapped")
            }) {
                Label("World", systemImage: "globe")
            }
            
            // 4. Prominent Style
            Button("Prominent") {
                print("Prominent tapped")
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            //5. Calling a function
            Text(message)
                .font(.title3)
                .padding()
            
            Button(action: toggleSignIn) {
                Text(isSignedIn ? "Sign Out" : "Sign In")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isSignedIn ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .font(.headline)
            }
            
            // ************************************************
            Spacer()
            
            // Color Picker
            ColorPicker("Alignment Guides", selection: $bgColor)
            
            // ***********************
            Spacer()
            
            // Date Picker
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            Text("\(dateFormatter.string(from: date))")
            
            Spacer()
            
            DatePicker(selection: $date) {
                Text("Start Date")
                Text("Select the starting date for the event")
            }
            
            Spacer()
            
            DatePicker(
                "Start Date",
                selection: $date,
                in: dateRange,
                displayedComponents: [.date, .hourAndMinute]
            )
            
        }
        .padding()
        
    }
    func toggleSignIn() {
        isSignedIn.toggle()
        message = isSignedIn ? "Welcome back! You're signed in." : "You are now signed out."
        print("Current Sign In State: \(isSignedIn)")
    }
    
    
}

#Preview {
    ContentView()
}


// 2 Color Picker

import SwiftUI

struct ColorPickerPage: View {
    @State private var bgColor: Color = .blue
    
    var body: some View {
        ZStack (alignment: .topTrailing){
            
            ColorPicker("", selection: $bgColor)
                .labelsHidden()
                .opacity(0.2)
                .background(
                    Image(systemName: "paintbrush")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                )
                .frame(width: 40, height: 40)
            
            VStack(spacing: 40) {
                Spacer()
                Image(systemName: "globe")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(bgColor)
                Spacer()
                
            }
            .padding()
        }
    }
}


#Preview {
    ColorPickerPage()
}

// 3. EditButton

import SwiftUI


struct EditButtonPage: View {
    
    @State private var fruits = [
        "Apple",
        "Banana",
        "Papaya",
        "Mango"
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                }
                .onDelete { fruits.remove(atOffsets: $0) }
                .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
            }
            .navigationTitle("Fruits")
            .toolbar {
                EditButton()
            }
        }
    }
}


#Preview {
    EditButtonPage()
}


// 4. Form

import SwiftUI

enum NotifyMeAboutType: String, CaseIterable, Identifiable {
    case directMessages
    case mentions
    case anything

    var id: String { self.rawValue }
}

enum ProfileImageSize: String, CaseIterable, Identifiable {
    case large
    case medium
    case small

    var id: String { self.rawValue }
}

struct FormPage: View {
    @State private var notifyMeAbout: NotifyMeAboutType = .mentions
    @State private var playNotificationSounds: Bool = true
    @State private var sendReadReceipts: Bool = false
    @State private var profileImageSize: ProfileImageSize = .medium
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Notifications")) {
                    Picker("Notify Me About", selection: $notifyMeAbout) {
                        Text("Direct Messages")
                            .tag(NotifyMeAboutType.directMessages)
                        Text("Mentions").tag(NotifyMeAboutType.mentions)
                        Text("Anything").tag(NotifyMeAboutType.anything)
                    }
                    Toggle(
                        "Play notification sounds",
                        isOn: $playNotificationSounds
                    )
                    Toggle("Send read receipts", isOn: $sendReadReceipts)
                }
                Section(header: Text("User Profiles")) {
                    Picker("Profile Image Size", selection: $profileImageSize) {
                        Text("Large").tag(ProfileImageSize.large)
                        Text("Medium").tag(ProfileImageSize.medium)
                        Text("Small").tag(ProfileImageSize.small)
                    }
                    Button("Clear Image Cache") { print("Cache cleared!") }
                }
                
                Section {
                    NavigationLink("Go to Content View Page") {
                        ContentView()
                    }
                }
                
                
            }
            .navigationTitle("Settings") // inside NavigationView
                    
        }
        
        
        //        Spacer()
        //
        //            HStack {
        //                Spacer()
        //                Form {
        //                    Picker("Notify Me About:", selection: $notifyMeAbout) {
        //                        Text("Direct Messages").tag(NotifyMeAboutType.directMessages)
        //                        Text("Mentions").tag(NotifyMeAboutType.mentions)
        //                        Text("Anything").tag(NotifyMeAboutType.anything)
        //                    }
        //
        //                    Toggle("Play notification sounds", isOn: $playNotificationSounds)
        //                    Toggle("Send read receipts", isOn: $sendReadReceipts)
        //
        //                    Picker("Profile Image Size:", selection: $profileImageSize) {
        //                        Text("Large").tag(ProfileImageSize.large)
        //                        Text("Medium").tag(ProfileImageSize.medium)
        //                        Text("Small").tag(ProfileImageSize.small)
        //                    }
        //                   .pickerStyle(.inline)
        //
        //                    Button("Clear Image Cache") {}
        //                }
        //                Spacer()
        //            }
        //            Spacer()
        //
    }
}

#Preview {
    FormPage()
}



// 5. Gauge and Stepper

import SwiftUI

struct GaugeAndStepper: View {
    @State private var current = 0.0
    @State private var minValue = 0.0
    @State private var maxValue = 100.0
    
    @State private var current2 = 0.0

    var body: some View {
        VStack {
            Spacer()
            
            HStack{
                Button {
                    if current > 0 {
                        current -= 25
                    }
                } label: {
                    Image(systemName: "arrow.left.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                }

                //                Gauge(value: current, in: minValue...maxValue) {
                //                    Image(systemName: "gauge.with.dots.needle.0percent")
                //
                //                } currentValueLabel: {
                //                    Text("\(Int(current))")
                //                        .foregroundColor(Color.green)
                //                }
                //                .gaugeStyle(.accessoryCircular)
                //                .foregroundStyle(.primary)
                //                .symbolVariant(.fill)

                Image(
                    systemName: "gauge.with.dots.needle.\(Int(current))percent"
                )
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.black)

                Button {
                    if current < 100 {
                        current += 25
                    }
                } label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                }

            }
            
            Spacer()
            
            // Second Gauge
            Gauge(value: current2, in: minValue...maxValue) {

            } currentValueLabel: {
                Text("\(Int(current2))")
                    .foregroundColor(Color.green)
            }
            .gaugeStyle(.accessoryCircular)
            .foregroundStyle(.primary)
            .symbolVariant(.fill)
            
            // Stepper code
            Stepper {
                Text("Value: \(current2)")
            } onIncrement: {
                incrementStep()
            } onDecrement: {
                decrementStep()
            }
            .padding(5)
            
            Spacer()
        }
        .padding()
    }
    
    func incrementStep() {
        if current2 < 100 { current2 += 5.0 }
    }

    func decrementStep() {
        if current2 > 0 { current2 -= 5.0 }
    }
    
}


#Preview {
    GaugeAndStepper()
}


// 6. Saving a File import SwiftUI
import UniformTypeIdentifiers
import PDFKit

struct DocumentComposerView: View {
    @State private var inputText: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    // Regex: letters, numbers, . , ; ! ?
    var isValidInput: Bool {
        let allowedCharacters = CharacterSet(
            charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,;!? \n"
        )
        return inputText.unicodeScalars
            .allSatisfy { allowedCharacters.contains($0) }
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Compose Your Document")
                .font(.headline)

            TextEditor(text: $inputText)
                .frame(height: 200)
                .border(isValidInput ? Color.green : Color.red, width: 2)
                .padding(.horizontal)

            HStack {
                Button("Save as TXT") {
                    saveTextFile()
                }
                .disabled(!isValidInput)

                Button("Save as PDF") {
                    savePDFFile()
                }
                .disabled(!isValidInput)
            }

            Spacer()
        }
        .padding()
        .alert("Status", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(alertMessage)
        }
    }

    func saveTextFile() {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            alertMessage = "Unable to access Documents directory"
            showAlert = true
            return
        }

        let fileURL = directory.appendingPathComponent("SavedDoc.txt")

        do {
            try inputText.write(to: fileURL, atomically: true, encoding: .utf8)
            alertMessage = "Text file saved at:\n\(fileURL.lastPathComponent)"
        } catch {
            alertMessage = "Failed to save .txt file"
        }

        showAlert = true
    }

    func savePDFFile() {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            alertMessage = "Unable to access Documents directory"
            showAlert = true
            return
        }

        let fileURL = directory.appendingPathComponent("SavedDoc.pdf")
        let pdfMetaData = [
            kCGPDFContextCreator: "MyApp",
            kCGPDFContextAuthor: "User"
        ]

        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]

        let pageWidth = 595.2
        let pageHeight = 841.8
        let renderer = UIGraphicsPDFRenderer(
            bounds: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight),
            format: format
        )

        do {
            try renderer.writePDF(to: fileURL) { context in
                context.beginPage()
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 14)
                ]
                inputText
                    .draw(
                        in: CGRect(
                            x: 20,
                            y: 20,
                            width: pageWidth - 40,
                            height: pageHeight - 40
                        ),
                        withAttributes: attributes
                    )
            }

            alertMessage = "PDF file saved at:\n\(fileURL.lastPathComponent)"
        } catch {
            alertMessage = "Failed to save PDF file"
        }

        showAlert = true
    }
}



#Preview {
    DocumentComposerView()
}


// 7. Sliders and Toggles

import SwiftUI

struct SlidersandToggles: View {
    @State private var speed = 0.0
  
    @State private var isEditing = false
    @State private var isProgressViewActive = true

    var body: some View {
        VStack {
            Slider(
                value: $speed,
                in: 0...100,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
            Text("\(speed)")
                .foregroundColor(isEditing ? .red : .blue)
            
            
            Toggle("Progress view is active", isOn: $isProgressViewActive)
                .padding()
            
           
            
            if isProgressViewActive {
                ProgressView(value: speed, total: 100)
                    .padding()
            }
            Button("Progress View") {
                if (isProgressViewActive) {
                    if speed < 100 {
                        speed += 5
                    }
                }
            }
            
            
        }
    }
}


#Preview {
    SlidersandToggles()
}

#Preview {
    PlaceholderElements()
}
