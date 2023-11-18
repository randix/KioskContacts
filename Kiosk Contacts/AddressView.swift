//
//  AdressiPhoneView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/25/21.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var contact = ContactModel.shared
    @ObservedObject var config = ConfigurationModel.shared
    
    @State var null = ""
    
    var body: some View {
        VStack(spacing: 5) {
            //Spacer().frame(height:10)
            
            Group {
               
                HStack(spacing: 3) {
                    Spacer().frame(width:config.leading)
                    Text("Address")
                        .frame(width:config.text, alignment: .trailing)
                    TextField("Street", text: $contact.addressline1)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .frame(width:config.width-config.text)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                    Spacer()
                }
                .frame(width:config.width)
                
                if config.addressline2 {
                    HStack(spacing: 3) {
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
                
                HStack(spacing: 3) {
                    Spacer().frame(width:config.leading)
                    Text("")
                        .frame(width:config.text)
                    TextField("City", text: $contact.city)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .frame(width:(config.width-config.text) * 0.45)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                    TextField("State", text: $contact.state)
                        .autocapitalization(.allCharacters)
                        .disableAutocorrection(true)
                        .frame(width:(config.width-config.text) * 0.2)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                    TextField("Zip", text: $contact.zipcode)
                        .frame(width:(config.width-config.text) * 0.32)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                        .keyboardType(.numberPad)
                    Spacer()
                }
                .frame(width:config.width)
                
                if config.country {
                    HStack(spacing: 3) {
                        Spacer().frame(width:config.leading)
                        Text("")
                            .frame(width:config.text)
                        TextField("Country", text: $contact.country)
                            .autocapitalization(.words)
                            .disableAutocorrection(true)
                            .frame(width:config.width-config.text)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0)
                            .lineLimit(1)
                            .minimumScaleFactor(0.4)
                        Spacer()
                    }
                    .frame(width:config.width)
                }
            }
        }
    }
}
