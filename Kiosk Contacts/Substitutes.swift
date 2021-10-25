//
//  Substitutes.swift
//  VMKiosk
//
//  Created by Rand Dow on 10/22/21.
//

import Foundation

enum SubstituteEnum: String {
    case event
    case title
    case subtitle
    case image
   
    case personaltitle
    case firstname
    case middlename
    case middleinitial
    case lastname
    case suffix
    
    case addressline1
    case addressline2
    case city
    case state
    case zipcode
    case country
    
    case organization
    
    case email
    case phone
}

class Substitute {
    
    static func substitute(_ text: String) -> String {
        //TODO: write this
        return text
    }
}
