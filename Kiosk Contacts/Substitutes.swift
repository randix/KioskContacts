//
//  Substitutes.swift
//  VMKiosk
//
//  Created by Rand Dow on 10/22/21.
//

import Foundation

class Substitute {
    
    let config = ConfigurationModel.shared
    let contact = ContactModel.shared
    
    func substitute(_ text: String) -> String {
        var replaced = text
        replaced = replaced.replacingOccurrences(of: "<event>", with: config.event)
        replaced = replaced.replacingOccurrences(of: "<kiosktitle>", with: config.kiosktitle)
        replaced = replaced.replacingOccurrences(of: "<subtitle>", with: config.subtitle)
        
        replaced = replaced.replacingOccurrences(of: "<title>", with: contact.title)
        replaced = replaced.replacingOccurrences(of: "<firstname>", with: contact.firstname)
        replaced = replaced.replacingOccurrences(of: "<middleinitial>", with: contact.middleinitial)
        replaced = replaced.replacingOccurrences(of: "<middlename>", with: contact.middlename)
        replaced = replaced.replacingOccurrences(of: "<lasname>", with: contact.lastname)
        replaced = replaced.replacingOccurrences(of: "<suffix>", with: contact.suffix)
        replaced = replaced.replacingOccurrences(of: "<addressline1>", with: contact.addressline1)
        replaced = replaced.replacingOccurrences(of: "<addressline2>", with: contact.addressline2)
        replaced = replaced.replacingOccurrences(of: "<city>", with: contact.city)
        replaced = replaced.replacingOccurrences(of: "<state>", with: contact.state)
        replaced = replaced.replacingOccurrences(of: "<zipcode>", with: contact.zipcode)
        replaced = replaced.replacingOccurrences(of: "<country>", with: contact.country)
        replaced = replaced.replacingOccurrences(of: "<organization>", with: contact.organization)
        replaced = replaced.replacingOccurrences(of: "<mail>", with: contact.mail)
        replaced = replaced.replacingOccurrences(of: "<phone>", with: contact.phone)
        return replaced
    }
}
