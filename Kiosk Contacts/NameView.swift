//
//  NameiPhone.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/25/21.
//

import SwiftUI

struct NameView: View {
    
    @ObservedObject var contact = ContactModel.shared
    @ObservedObject var config = ConfigurationModel.shared
    
    var body: some View {
        VStack(spacing: 5) {
           
            if config.title {
                HStack(spacing: 3) {
                    Spacer().frame(width:config.leading)
                    Text("Title")
                        .frame(width: config.text, alignment: .trailing)
                    TextField("Mr. …", text: $contact.title)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .frame(width:config.width-config.text)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                    Spacer()
                }.frame(width:config.width)
            }
            
            HStack(spacing: 3) {
                Spacer().frame(width:config.leading)
                Text("First")
                    .frame(width: config.text, alignment: .trailing)
                TextField("First Name", text: $contact.firstname)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                    .frame(width:config.width-config.text)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 0)
                    .lineLimit(1).minimumScaleFactor(0.6)
                Spacer()
            }
            .frame(width:config.width)
            
            if config.middlename {
                HStack(spacing: 3) {
                    Spacer().frame(width:config.leading)
                    Text("Middle")
                        .frame(width: config.text, alignment: .trailing)
                    TextField("Middle Name", text: $contact.middlename)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .frame(width:config.width-config.text)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1).minimumScaleFactor(0.6)
                    Spacer()
                }
                .frame(width:config.width)
            }
            
            if config.middleinitial {
                HStack(spacing: 3) {
                    Spacer().frame(width:config.leading)
                    Text("MI")
                        .frame(width: config.text, alignment: .trailing)
                    TextField("MI", text: $contact.middleinitial)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .frame(width:config.width-config.text)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                    Spacer()
                }
                .frame(width:config.width)
            }
            
            HStack(spacing: 3) {
                Spacer().frame(width:config.leading)
                Text("Last")
                    .frame(width: config.text, alignment: .trailing)
                TextField("Last Name", text: $contact.lastname)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                    .frame(width:config.width-config.text)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 0)
                    .lineLimit(1).minimumScaleFactor(0.6)
                Spacer()
            }
            .frame(width:config.width)
            
            if config.suffix {
                HStack(spacing: 3) {
                    Spacer().frame(width:config.leading)
                    Text("Suffix")
                        .frame(width: config.text, alignment: .trailing)
                    TextField("Jr. …", text: $contact.suffix)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .frame(width:config.width-config.text)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                    Spacer()
                }
                .frame(width:config.width)
            }
        }
    }
}
