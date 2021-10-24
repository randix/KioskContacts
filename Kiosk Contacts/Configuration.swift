//
//  Configuration.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/24/21.
//

import Foundation

class Configuration {
    
    private init() {}
    static let shared = Configuration()
    
    let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
   
    let settings = "settings.txt"
    let mail = "mail.txt"
    let subject = "subject.txt"
    let sender = "sender.txt"
    let message = "message.txt"
    
    
    var iconImage = ""
    var title = ""
    var subtitle = ""
    
    var mailConents = ""
    var mailSender = ""
    var mailSubject = ""
    
    var messageConent = ""
    
    func readConfig() {
        print(#function)
        initializeConfig()
        
        let settingsUrl = docDir.appendingPathComponent("settings")
        if let settingsContents = try? String(contentsOf: settingsUrl) {
            let lines = settingsContents.split(whereSeparator: \.isNewline)
            print(lines)
        }
    
        
    }
                                                    
    
    func initializeConfig() {
        // TODO: replace any missing file from the bundle
        copyfileToUserDocumentDirectory(settings)
        copyfileToUserDocumentDirectory(mail)
        copyfileToUserDocumentDirectory(subject)
        copyfileToUserDocumentDirectory(sender)
        copyfileToUserDocumentDirectory(message)
    }
    
    func copyfileToUserDocumentDirectory(_ name: String)
    {
        let nameExt = name.split(separator: ".")
        if let bundlePath = Bundle.main.path(forResource: String(nameExt[0]), ofType: String(nameExt[1])) {
            let destUrl = docDir.appendingPathComponent(name)
            if !FileManager.default.fileExists(atPath: destUrl.path) {
                try? FileManager.default.copyItem(atPath: bundlePath, toPath: destUrl.path)
            }
        }
    }
}

