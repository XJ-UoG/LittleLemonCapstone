//
//  ioscapstoneApp.swift
//  ioscapstone
//
//  Created by Tan Xin Jie on 3/12/24.
//

import SwiftUI

@main
struct ioscapstoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Onboarding()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
