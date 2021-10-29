//
//  Data.swift
//  kiosk
//
//  Created by Rand Dow on 10/22/21.
//

import Foundation

class Contact: ObservableObject {
    
    private init() {}
    static let shared = Contact()
    
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
        phone = ""
        mail = ""
    }
    
    func add() {
        let contactsUrl = docDir.appendingPathComponent(contactsFile)
        
        var csvline = ""
        var first = true
        for f in [title, firstname, middlename, middleinitial, lastname, suffix,
                  addressline1, addressline2, city, state, zipcode,country,
                  organization, phone, mail] {
            csvline = appendfield(first, csvline, f)
            first = false
        }
        csvline += "\n"
        
        do {
            if FileManager.default.fileExists(atPath: contactsUrl.path) {
                let fileHandle = try FileHandle(forWritingTo: contactsUrl)
                fileHandle.seekToEndOfFile()
                fileHandle.write(Data(csvline.utf8))
                fileHandle.closeFile()
            } else {
                let header = "title,firstname,middlename,middleinitial,lastname,suffix,addressline1,addressline2,city,state,zipcode,country,organization,phone,mail\n" + csvline
                try header.write(to: contactsUrl, atomically: true, encoding: .utf8)
            }
        } catch {
            print(error.localizedDescription)
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
