//
//  AddressiPadView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/25/21.
//

import SwiftUI

struct AddressiPadView: View {
    
    @ObservedObject var contact = Contact.shared
    @ObservedObject var config = Configuration.shared
    
    let leadingFrame = CGFloat(45)
    
    let fs = CGFloat(14)
    let fsTitle = CGFloat(18)
    let fsSubtitle = CGFloat(14)
    
    var body: some View {
        VStack {
            Spacer().frame(height:20)
            
            Group {
                HStack {
                    Spacer().frame(width:20)
                    Text("Address")
                        .font(.system(size: fs))
                        .frame(width:60, alignment: .leading)
                    Spacer()
                }.frame(width:700)
                
                HStack {
                    Spacer().frame(width:20)
                    TextField("Street", text: $contact.addressline1)
                        .autocapitalization(.words)
                        .font(.system(size: fs))
                        .frame(width:640)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    Spacer()
                }.frame(width:700)
                
                if config.addressline2 {
                    HStack {
                        Spacer().frame(width:20)
                        TextField("Address Line 2", text: $contact.addressline2)
                            .autocapitalization(.words)
                            .font(.system(size: fs))
                            .frame(width:640)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        Spacer()
                    }.frame(width:700)
                }
                
                HStack(spacing:2) {
                    Spacer().frame(width:20)
                    TextField("City", text: $contact.city)
                        .autocapitalization(.words)
                        .font(.system(size: fs))
                        .frame(width:210)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    TextField("State", text: $contact.state)
                        .autocapitalization(.allCharacters)
                        .font(.system(size: fs))
                        .frame(width:110)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    TextField("Zip", text: $contact.zipcode)
                        .font(.system(size: fs))
                        .frame(width:110)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        .keyboardType(.numberPad)
                    
                    if config.country {
                        TextField("Country", text: $contact.country)
                            .autocapitalization(.words)
                            .font(.system(size: fs))
                            .frame(width:200)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    }
                    
                    Spacer()
                }.frame(width:700)
            }
        }
    }
}
