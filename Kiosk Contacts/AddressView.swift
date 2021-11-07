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
    
    @State var null = ""
    
    var body: some View {
        VStack {
            Spacer().frame(height:10)
            
            Group {
               
                HStack(spacing: 2) {
                    Spacer().frame(width:config.leading)
                    Text("Address")
                        .frame(width:config.text, alignment: .trailing)
                    TextField("Street", text: $contact.addressline1)
                        .autocapitalization(.words)
                        .frame(width:config.width-config.text)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                    Spacer()
                }
                .frame(width:config.width)
                
                if config.addressline2 {
                    HStack(spacing: 2) {
                        Spacer().frame(width:config.leading)
                        Text("")
                            .frame(width:config.text)
                        TextField("Address Line 2", text: $contact.addressline2)
                            .autocapitalization(.words)
                            .frame(width:config.width-config.text)
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
                    Text("")
                        .frame(width:config.text)
                    TextField("City", text: $contact.city)
                        .autocapitalization(.words)
                        .frame(width:(config.width-config.text) * 0.4)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                    TextField("State", text: $contact.state)
                        .autocapitalization(.allCharacters)
                        .frame(width:(config.width-config.text) * 0.2)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                    TextField("Zip", text: $contact.zipcode)
                        .frame(width:(config.width-config.text) * 0.2)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                        .keyboardType(.numberPad)
                    
                    if config.country {
                        TextField("Country", text: $contact.country)
                            .autocapitalization(.words)
                            .frame(width:(config.width-config.text) * 0.19)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0)
                            .lineLimit(1)
                            .minimumScaleFactor(0.4)
                    } else {
                        TextField("", text: $null)
                            .frame(width:(config.width-config.text) * 0.19)
                            .padding(.horizontal, 0)
                    }
                    
                    Spacer()
                }
                .frame(width:config.width)
                
            }
        }
    }
}
