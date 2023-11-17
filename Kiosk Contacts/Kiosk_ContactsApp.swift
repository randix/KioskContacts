//
//  Kiosk_ContactsApp.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/23/21.
//

import SwiftUI

@main
struct Kiosk_ContactsApp: App {
    
    // iphone 8:          375 x 667
    // iphone 13 pro max: 428 x 926
    // ipad mini:         744 x 1133
    // ipad pro 11:       834 x 1194
    // ipad pro 12.9:    1024 x 1366
    
    init() {
        ConfigurationModel.shared.readConfig()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
