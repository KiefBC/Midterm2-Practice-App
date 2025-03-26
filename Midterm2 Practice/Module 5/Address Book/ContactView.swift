//
//  ContactView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//

import SwiftUI

struct ContactView: View {
    @Bindable var address: Addressbook
    
    var body: some View {
        VStack {
            TextField("Enter Name", text: $address.name)
                .multilineTextAlignment(.center)
            TextField("Email", text: $address.email)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    let addressPreview = Addressbook(name: "Kiefer", email: "Email")
    ContactView(address: addressPreview)
}
