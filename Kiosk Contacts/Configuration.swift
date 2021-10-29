//
//  Configuration.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/24/21.
//

import Foundation
import UIKit
import SwiftUI

enum SizeClass {
    case iPhoneLandscape
    case iPhonePortrait
    case iPad
}

class Configuration: ObservableObject {
    
    private init() {}
    static let shared = Configuration()
    
    @Published var setupCount = 0
    
    let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
   
    let settings = "settings.txt"
    let mail = "mail.txt"
    let subject = "subject.txt"
    let sender = "sender.txt"
    let message = "message.txt"
    let icon = "VM Logo Color Thrive Tag.jpg"
    
    @Published var pin = ""
    
    var iconImage: UIImage?
    @Published var image = ""
    @Published var title = ""
    @Published var subtitle = ""
    
    @Published var event = ""
    
    @Published var mailContents: String?
    @Published var sendermail = ""
    @Published var sendersignature = ""
    @Published var subjectContents: String?
    
    @Published var messageContents: String?
    
    @Published var personaltitle = false
    @Published var firstname = true
    @Published var middlename = false
    @Published var middleinitial = false
    @Published var lastname = true
    @Published var suffix = true

    @Published var addressline1 = true
    @Published var addressline2 = false
    @Published var city = true
    @Published var state = true
    @Published var zipcode = true
    @Published var country = false

    @Published var organization = false

    @Published var mailaddress = true
    @Published var enablemailsend = false
    
    @Published var phone = true
    @Published var enablemessagesend = false
    
    var appName = ""
    var appVersion = ""
    var appBuild = ""
    var app = ""
    
    func readConfig() {
        
        let dictionary = Bundle.main.infoDictionary!
        appName = dictionary["CFBundleName"] as! String
        appVersion = dictionary["CFBundleShortVersionString"] as! String
        appBuild = dictionary["CFBundleVersion"] as! String
        app = "\(appName) Version \(appVersion).\(appBuild)"
        
        initializeConfig()
        
        let iconUrl = docDir.appendingPathComponent(icon)
        if let data = try? Data(contentsOf: iconUrl) {
            iconImage = UIImage(data: data)!
        }
        
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
                case "pin":
                    pin = value
                case "title":
                    title = value
                case "subtitle":
                    subtitle = value
                case "image":
                    image = value
                case "event":
                    event = value
                    
                case "personaltitle":
                    personaltitle = value != "0"
                case "firstname":
                    firstname = value != "0"
                case "middlename":
                    middlename = value != "0"
                case "middleinitial":
                    middleinitial = value != "0"
                case "lastname":
                    lastname = value != "0"
                case "suffix":
                    suffix = value != "0"

                case "addressline1":
                    addressline1 = value != "0"
                case "addressline2":
                    addressline2 = value != "0"
                case "city":
                    city = value != "0"
                case "state":
                    state = value != "0"
                case "zipcode":
                    zipcode = value != "0"
                case "country":
                    country = value != "0"

                case "organization":
                    organization = value != "0"

                case "mailaddress":
                    mailaddress = value != "0"
                    
                case "enablemailsend":
                    enablemailsend = value != "0"

                case "phone":
                    phone = value != "0"
                    
                case "enablemessagesend":
                    enablemessagesend = value != "0"
                    
                default:
                    print("unknown: \(key) \(value)")
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
        copyfileToUserDocumentDirectory(icon)
        copyfileToUserDocumentDirectory("README.md")
        copyfileToUserDocumentDirectory("README.pdf")
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

