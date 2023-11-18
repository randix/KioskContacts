//
//  ContactiPhoneView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/25/21.
//

import SwiftUI

struct ContactView: View {
    
    @ObservedObject var contact = ContactModel.shared
    @ObservedObject var config = ConfigurationModel.shared
    
    let leadingOrg = CGFloat(110)
  
    var body: some View {
        
        VStack(spacing: 5) {
            
            if config.mailaddress {
                HStack(spacing: 3) {
                    Spacer().frame(width:config.leading)
                    Text("Mail")
                        .frame(width: config.text, alignment: .trailing)
                        //.background(Color.yellow)
                    TextField("john@example.com", text: $contact.mail)
                        .frame(width:config.width-config.text)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                        .keyboardType(.emailAddress)
                        .autocapitalization(UITextAutocapitalizationType.none)
                        .disableAutocorrection(true)
                    Spacer()
                }
                .frame(width:config.width)
            }
           
            if config.phone {
                HStack(spacing: 3) {
                    Spacer().frame(width:config.leading)
                    Text("Phone")
                        .frame(width: config.text, alignment: .trailing)
                        //.background(Color.yellow)
                    TextField("999-999-9999", text: $contact.phone)
                        .frame(width:config.width-config.text)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        .keyboardType(.numbersAndPunctuation)
                    Spacer()
                }
                .frame(width:config.width)
            }
           
            if config.organization {
                Spacer().frame(width:config.leading)
                HStack(spacing: 3) {
                    Spacer().frame(width:config.leading)
                    Text("Organization")
                        .frame(width:leadingOrg, alignment: .trailing)
                        //.background(Color.yellow)
                    TextField("Organization", text: $contact.organization)
                        .autocapitalization(UITextAutocapitalizationType.none)
                        .disableAutocorrection(true)
                        .frame(width:config.width-leadingOrg)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    Spacer()
                }
                .frame(width:config.width)
            }
        }
    }
}

