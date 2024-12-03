//
//  Onboard.swift
//  ioscapstone
//
//  Created by Tan Xin Jie on 3/12/24.
//

import SwiftUI

let kFirstName = "fnkey"
let kLastName = "lnkey"
let kEmail = "emkey"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) { EmptyView() }
                Text("Register")
                Form {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                }
                Button("Log In") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty{
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        self.isLoggedIn = true
                    }
                }
            }
            .padding()
            .onAppear{
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) == true {
                    isLoggedIn = true
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}
