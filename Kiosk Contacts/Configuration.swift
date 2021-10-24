//
//  Configuration.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/24/21.
//

import Foundation
import UIKit

class Configuration {
    
    private init() {}
    static let shared = Configuration()
    
    let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
   
    let settings = "settings.txt"
    let mail = "mail.txt"
    let subject = "subject.txt"
    let sender = "sender.txt"
    let message = "message.txt"
    
    
    var iconImage: UIImage?
    var image = ""
    var title = ""
    var subtitle = ""
    var background = ""
    
    var mailContents: String?
    var sendermail = ""
    var sendersignature = ""
    var subjectContents: String?
    
    var messageContents: String?
    
    func readConfig() {
        print(#function)
        initializeConfig()
        
        let settingsUrl = docDir.appendingPathComponent(settings)
        if let settingsContents = try? String(contentsOf: settingsUrl) {
            let lines = settingsContents.split(whereSeparator: \.isNewline)
            for line in lines {
                let keyValue = line.split(separator: "=")
                if keyValue.count != 2 {
                    continue
                }
                let key = keyValue[0].trimmingCharacters(in: .whitespaces)
                let value = keyValue[1].trimmingCharacters(in: .whitespaces)
                
                switch key {
                case "title":
                    title = value
                case "subtitle":
                    subtitle = value
                case "background":
                    background = value
                case "image":
                    image = value
                default:
                    print("unknown")
                }
            }
        }
        
        let mailUrl = docDir.appendingPathComponent(mail)
        mailContents = try? String(contentsOf: mailUrl)
        
        let subjectUrl = docDir.appendingPathComponent(subject)
        subjectContents = try? String(contentsOf: subjectUrl)
        
        let senderUrl = docDir.appendingPathComponent(sender)
        if let senderContents = try? String(contentsOf: senderUrl) {
            let lines = senderContents.split(whereSeparator: \.isNewline)
            for line in lines {
                let keyValue = line.split(separator: "=")
                if keyValue.count != 2 {
                    continue
                }
                let key = keyValue[0].trimmingCharacters(in: .whitespaces)
                let value = keyValue[1].trimmingCharacters(in: .whitespaces)
                
                switch key {
                case "sendermail":
                    sendermail = value
                case "sendersignature":
                    sendersignature = value
                default:
                    print("unknown")
                }
            }
        }
        
        let messageUrl = docDir.appendingPathComponent(message)
        messageContents = try? String(contentsOf: messageUrl)
    }

    func initializeConfig() {
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

