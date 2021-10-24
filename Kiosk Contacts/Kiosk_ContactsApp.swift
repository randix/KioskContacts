//
//  Kiosk_ContactsApp.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/23/21.
//

import SwiftUI

@main
struct Kiosk_ContactsApp: App {
    
    init() {
        Configuration.shared.readConfig()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
