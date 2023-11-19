//
//  ContactModel.swift
//  kiosk
//
//  Created by Rand Dow on 10/22/21.
//

import Foundation

class ContactModel: ObservableObject {
    
    private init() {}
    static let shared = ContactModel()
    
    let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let contactsFile = "contacts.csv"
   
    @Published var title = ""
    @Published var firstname = ""
    @Published var middlename = ""
    @Published var middleinitial = ""
    @Published var lastname = ""
    @Published var suffix = ""
    
    @Published var addressline1 = ""
    @Published var addressline2 = ""
    @Published var city = ""
    @Published var state = ""
    @Published var zipcode = ""
    @Published var country = ""
    
    @Published var organization = ""
    @Published var note = ""
    @Published var phone = ""
    @Published var mail = ""
    
    
    func clear() {
        title = ""
        firstname = ""
        middlename = ""
        middleinitial = ""
        lastname = ""
        suffix = ""
        
        addressline1 = ""
        addressline2 = ""
        city = ""
        state = ""
        zipcode = ""
        country = ""
        
        organization = ""
        note = ""
        phone = ""
        mail = ""
    }
    
    func add() {
        let contactsUrl = docDir.appendingPathComponent(contactsFile)
        
        var header = ""
        var csvline = ""
        var first = true
        

//            var fixed = f.trimmingCharacters(in: .whitespaces)
//            if fixed.contains(",") {
//                fixed = "\(fixed)"
//            }

        
        if ConfigurationModel.shared.title {
            header += "title,"
            csvline = appendfield(first, csvline, title.trimmingCharacters(in: .whitespaces))
            first = false
        }
        if ConfigurationModel.shared.firstname {
            header += "firstname,"
            csvline = appendfield(first, csvline, firstname.trimmingCharacters(in: .whitespaces))
            first = false
        }
        if ConfigurationModel.shared.middlename {
            header += "middlename,"
            csvline = appendfield(first, csvline, middlename.trimmingCharacters(in: .whitespaces))
            first = false
        }
        if ConfigurationModel.shared.middleinitial {
            header += "middleinitial,"
            csvline = appendfield(first, csvline, middleinitial.trimmingCharacters(in: .whitespaces))
            first = false
        }
        if ConfigurationModel.shared.lastname {
            header += "lastname,"
            csvline = appendfield(first, csvline, lastname.trimmingCharacters(in: .whitespaces))
            first = false
        }
        if ConfigurationModel.shared.suffix {
            header += "suffix,"
            csvline = appendfield(first, csvline, suffix.trimmingCharacters(in: .whitespaces))
            first = false
        }
        
        if ConfigurationModel.shared.addressline1 {
            header += "addressline1,"
            csvline = appendfield(first, csvline, addressline1.trimmingCharacters(in: .whitespaces))
            first = false
        }
        if ConfigurationModel.shared.addressline2 {
            header += "addressline2,"
            csvline = appendfield(first, csvline, addressline2.trimmingCharacters(in: .whitespaces))
            first = false
        }
        if ConfigurationModel.shared.city {
            header += "city,"
            csvline = appendfield(first, csvline, city.trimmingCharacters(in: .whitespaces))
            first = false
        }
        if ConfigurationModel.shared.state {
            header += "state,"
            csvline = appendfield(first, csvline, state.trimmingCharacters(in: .whitespaces))
            first = false
        }
        if ConfigurationModel.shared.zipcode {
            header += "zipcode,"
            csvline = appendfield(first, csvline, zipcode.trimmingCharacters(in: .whitespaces))
            first = false
        }
        if ConfigurationModel.shared.country {
            header += "country,"
            csvline = appendfield(first, csvline, country.trimmingCharacters(in: .whitespaces))
            first = false
        }
        
        if ConfigurationModel.shared.organization {
            header += "organization,"
            csvline = appendfield(first, csvline, organization.trimmingCharacters(in: .whitespaces))
            first = false
        }
        if ConfigurationModel.shared.phone {
            header += "phone,"
            csvline = appendfield(first, csvline, phone.trimmingCharacters(in: .whitespaces))
            first = false
        }
        if ConfigurationModel.shared.mailaddress {
            header += "mail,"
            csvline = appendfield(first, csvline, mail.trimmingCharacters(in: .whitespaces))
            first = false
        }
        if ConfigurationModel.shared.note {
            header += "note,"
            csvline = appendfield(first, csvline, note.trimmingCharacters(in: .whitespaces))
            first = false
        }
        
        // Add date/time
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        header += "date\n"
        csvline += ",\(dateFormatter.string(from: date))\n"
        
        do {
            let exists = FileManager.default.fileExists(atPath: contactsUrl.path)
            if !exists {
                try header.write(to: contactsUrl, atomically: true, encoding: .utf8)
                ConfigurationModel.shared.configChanged = false
            }
            let fileHandle = try FileHandle(forWritingTo: contactsUrl)
            fileHandle.seekToEndOfFile()
            if ConfigurationModel.shared.configChanged {
                fileHandle.write(Data(header.utf8))
                ConfigurationModel.shared.configChanged = false
                fileHandle.write(Data(csvline.utf8))
            } else {
                fileHandle.write(Data(csvline.utf8))
            }
            fileHandle.closeFile()
        } catch {
            print("Error: ", error.localizedDescription)
        }
    }
    
    func appendfield(_ first: Bool, _ line: String, _ field: String) -> String {
        var newLine = line
        if first == false {
            newLine += ","
        }
        var stringContainsComma = false
        if field.contains(",") {
            stringContainsComma = true
        }
        if stringContainsComma {
            newLine += "\""
        }
        newLine += field.trimmingCharacters(in: .whitespaces)
        if stringContainsComma {
            newLine += "\""
        }
        return newLine
    }
}
