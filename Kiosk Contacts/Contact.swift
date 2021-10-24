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
    
    @Published var firstname = ""
    @Published var lastname = ""
    @Published var addressline1 = ""
    @Published var addressline2 = ""
    @Published var city = ""
    @Published var state = ""
    @Published var zipcode = ""
    @Published var phone = ""
    @Published var mail = ""
    
    func clear() {
        firstname = ""
        lastname = ""
        addressline1 = ""
        addressline2 = ""
        city = ""
        state = ""
        zipcode = ""
        phone = ""
        mail = ""
    }
    
    func add() {
        
    }
}
