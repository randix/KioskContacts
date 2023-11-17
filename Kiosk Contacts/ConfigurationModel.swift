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

class ConfigurationModel: ObservableObject {
    
    private init() { }
    static let shared = ConfigurationModel()
    
    var iPad = UIScreen.main.bounds.width > 600
    
    var leading = CGFloat(5)
    var width = CGFloat(735)
    var text = CGFloat(50)
    
    @Published var setupCount = 0
    
    let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
   
    let settings = "settings.txt"
    let mail = "mail.txt"
    let message = "message.txt"
    
    @Published var pin = ""
    @Published var iconImage: UIImage?
    
    @Published var image = ""
    @Published var kiosktitle = ""
    @Published var subtitle = ""
    
    @Published var event = ""
    
    @Published var mailContents = ""
    @Published var from = ""
    @Published var subject = ""
    
    @Published var messageContents = ""
    
    @Published var title = false
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
    @Published var note = true

    @Published var mailaddress = true
    @Published var mailsend = false
    
    @Published var phone = true
    @Published var messagesend = false
    
    var appName = ""
    var appVersion = ""
    var appBuild = ""
    var app = ""
    
    func readConfig() {
        
        if iPad {
            width = CGFloat(720)
            text = CGFloat(110)
        } else {
            width = CGFloat(340)
            text = CGFloat(65)
        }
        let dictionary = Bundle.main.infoDictionary!
        appName = dictionary["CFBundleName"] as! String
        appVersion = dictionary["CFBundleShortVersionString"] as! String
        appBuild = dictionary["CFBundleVersion"] as! String
        app = "\(appName) Version \(appVersion).\(appBuild)"
        
        initializeConfig()
        print(docDir)
        
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
                case "kiosktitle":
                    kiosktitle = value
                case "subtitle":
                    subtitle = value
                case "image":
                    image = value
                    let iconUrl = docDir.appendingPathComponent(image)
                    if  FileManager.default.fileExists(atPath: iconUrl.path) {
                        if let data = try? Data(contentsOf: iconUrl) {
                            iconImage = UIImage(data: data)!
                        }
                    } else {
                        if let icon1024Url = Bundle.main.url(forResource: "1024", withExtension: "png") {
                            if let data = try? Data(contentsOf: icon1024Url) {
                                iconImage = UIImage(data: data)!
                            }
                        }
                    }
                case "event":
                    event = value
                    
                case "title":
                    title = value != "0"
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
                case "note":
                    note = value != "0"

                case "mailaddress":
                    mailaddress = value != "0"
                    
                case "mailsend":
                    mailsend = value != "0"

                case "phone":
                    phone = value != "0"
                    
                case "messagesend":
                    messagesend = value != "0"
                    
                default:
                    print("unknown: \(key) \(value)")
                }
            }
        }
        
        let mailUrl = docDir.appendingPathComponent(mail)
        from = ""
        subject = ""
        mailContents = ""
        do {
            let mailFileContents = try String(contentsOf: mailUrl)
            let lines = mailFileContents.split(omittingEmptySubsequences: false, whereSeparator: \.isNewline)
            if lines.count > 2 {
                let l1 = lines[0].trimmingCharacters(in: .whitespaces)
                let l2 = lines[1].trimmingCharacters(in: .whitespaces)
                for l in [l1, l2] {
                    let keyValue = l.split(separator: ":")
                    if keyValue.count != 2 {
                        continue
                    }
                    let key = keyValue[0].trimmingCharacters(in: .whitespaces)
                    let value = keyValue[1].trimmingCharacters(in: .whitespaces)
                    switch key {
                    case "from":
                        from = value
                    case "subject":
                        subject = value
                    default:
                        print("unknown: \(key) \(value)")
                    }
                }
                for line in  lines[3..<lines.count] {
                    mailContents += line + "\n"
                }
            }
            
        } catch {}
        
        let messageUrl = docDir.appendingPathComponent(message)
        messageContents = ""
        do {
            messageContents = try String(contentsOf: messageUrl)
        } catch {}
    }

    func initializeConfig() {
        copyfileToUserDocumentDirectory(settings)
        copyfileToUserDocumentDirectory(mail)
        copyfileToUserDocumentDirectory(message)
        copyfileToUserDocumentDirectory("README.md")
        copyfileToUserDocumentDirectory("README.pdf")
        copyfileToUserDocumentDirectory("Updates.txt")
        
        copyfileToUserDocumentDirectory("1024.png")
        copyfileToUserDocumentDirectory("VM Logo Color Thrive Tag.jpg")
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

