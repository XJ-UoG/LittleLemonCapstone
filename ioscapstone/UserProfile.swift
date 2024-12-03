//
//  UserProfile.swift
//  ioscapstone
//
//  Created by Tan Xin Jie on 3/12/24.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    @State private var firstName: String = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State private var lastName: String = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State private var email: String = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    @State private var orderStatus: Bool = false
    @State private var offer: Bool = false
    @State private var newsletter: Bool = false
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("First Name", text: $firstName)
                } header: {
                    Text("First Name")
                }
                Section {
                    TextField("Last Name", text: $lastName)
                } header: {
                    Text("Last Name")
                }
                Section {
                    TextField("Email", text: $email)
                } header: {
                    Text("Email")
                }
                Section {
                    Toggle("Order Status", isOn: $orderStatus)
                    Toggle("Special Offers", isOn: $offer)
                    Toggle("Newsletters", isOn: $newsletter)
                } header: {
                    Text("Email Notifications")
                }
            }
            HStack {
                Button(action: { }) {
                    Text("Discard")
                }
                .foregroundColor(Color.gray)
                .tint(.white)
                Button("Save", action: {
                    
                })
                .foregroundColor(Color.white)
                .tint(.green)
            }
            Button(action: {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Log out")
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .foregroundColor(Color.black)
            .tint(.yellow)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle)
    }
}

#Preview {
    UserProfile()
}
