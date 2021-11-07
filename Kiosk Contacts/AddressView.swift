//
//  AdressiPhoneView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/25/21.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var contact = Contact.shared
    @ObservedObject var config = Configuration.shared
    
    var body: some View {
        VStack {
            Spacer().frame(height:10)
            
            Group {
                HStack {
                    Spacer().frame(width:config.leading)
                    Text("Address")
                        .frame(width:70, alignment: .leading)
                    Spacer()
                }
                .frame(width:config.width)
                
                HStack {
                    Spacer().frame(width:config.leading)
                    TextField("Street", text: $contact.addressline1)
                        .autocapitalization(.words)
                        .frame(width:config.width-5)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                    Spacer()
                }
                .frame(width:config.width)
                
                if config.addressline2 {
                    HStack {
                        Spacer().frame(width:config.leading)
                        TextField("Address Line 2", text: $contact.addressline2)
                            .autocapitalization(.words)
                            .frame(width:config.width-5)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0)
                            .lineLimit(1)
                            .minimumScaleFactor(0.4)
                        Spacer()
                    }
                    .frame(width:config.width)
                }
                
                HStack(spacing:2) {
                    Spacer().frame(width:config.leading)
                    TextField("City", text: $contact.city)
                        .autocapitalization(.words)
                        .frame(width:config.width * 0.4)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                    TextField("State", text: $contact.state)
                        .autocapitalization(.allCharacters)
                        .frame(width:config.width * 0.15)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                    TextField("Zip", text: $contact.zipcode)
                        .frame(width:config.width * 0.2)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                        .keyboardType(.numberPad)
                    
                    if config.country {
                        TextField("Country", text: $contact.country)
                            .autocapitalization(.words)
                            .frame(width:config.width * 0.22)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0)
                            .lineLimit(1)
                            .minimumScaleFactor(0.4)
                    }
                    
                    Spacer()
                }
                .frame(width:config.width)
                
            }
        }
    }
}
