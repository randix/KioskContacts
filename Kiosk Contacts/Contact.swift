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
    @Published var nameaffix = ""
    
    @Published var addressline1 = ""
    @Published var addressline2 = ""
    @Published var city = ""
    @Published var state = ""
    @Published var zipcode = ""
    
    @Published var organization = ""
    @Published var phone = ""
    @Published var mail = ""
    
    
    func clear() {
        title = ""
        firstname = ""
        middlename = ""
        middleinitial = ""
        lastname = ""
        nameaffix = ""
        
        addressline1 = ""
        addressline2 = ""
        city = ""
        state = ""
        zipcode = ""
        
        organization = ""
        phone = ""
        mail = ""
    }
    
    func add() {
        // TODO: consider that there might be a comma in some field
        let contactsUrl = docDir.appendingPathComponent(contactsFile)
        
        var csvline = ""
        for f in [title, firstname, middlename, middleinitial, lastname, nameaffix,
                  addressline1, addressline2, city, state, zipcode,
                  organization, phone, mail] {
            csvline = appendfield(csvline, f)
        }
        csvline += "\n"
        
        do {
            if FileManager.default.fileExists(atPath: contactsUrl.path) {
                let fileHandle = try FileHandle(forWritingTo: contactsUrl)
                fileHandle.seekToEndOfFile()
                fileHandle.write(Data(csvline.utf8))
                fileHandle.closeFile()
            } else {
                let header = "title,firstname,middlename,middleinitial,lastname,nameaffix,addressline1,addressline1,city,state,zipcode,organization,phone,mail\n" + csvline
                try header.write(to: contactsUrl, atomically: true, encoding: .utf8)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func appendfield(_ line: String, _ field: String) -> String {
        var newLine = line
        if newLine != "" {
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
