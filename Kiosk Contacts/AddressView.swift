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
    
    @State var width = CGFloat(360)
    @State var fs = CGFloat(14)
    
    var body: some View {
        VStack {
            Spacer().frame(height:10)
            
            Group {
                HStack {
                    Spacer().frame(width:10)
                    Text("Address")
                        .font(.system(size: fs))
                        .frame(width:60, alignment: .leading)
                    Spacer()
                }.frame(width:width)
                
                HStack {
                    Spacer().frame(width:10)
                    TextField("Street", text: $contact.addressline1)
                        .autocapitalization(.words)
                        .font(.system(size: fs))
                        .frame(width:width-20)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                    Spacer()
                }.frame(width:width)
                
                if config.addressline2 {
                    HStack {
                        Spacer().frame(width:10)
                        TextField("Address Line 2", text: $contact.addressline2)
                            .autocapitalization(.words)
                            .font(.system(size: fs))
                            .frame(width:width-20)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0)
                            .lineLimit(1)
                            .minimumScaleFactor(0.4)
                        Spacer()
                    }.frame(width:width)
                }
                
                HStack(spacing:2) {
                    Spacer().frame(width:10)
                    TextField("City", text: $contact.city)
                        .autocapitalization(.words)
                        .font(.system(size: fs))
                        .frame(width:130)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                    TextField("State", text: $contact.state)
                        .autocapitalization(.allCharacters)
                        .font(.system(size: fs))
                        .frame(width:60)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                    TextField("Zip", text: $contact.zipcode)
                        .font(.system(size: fs))
                        .frame(width:70)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                        .keyboardType(.numberPad)
                    
                    if config.country {
                        TextField("Country", text: $contact.country)
                            .autocapitalization(.words)
                            .font(.system(size: fs))
                            .frame(width:70)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0)
                            .lineLimit(1)
                            .minimumScaleFactor(0.4)
                    }
                    
                    Spacer()
                }.frame(width:width)
                
            }
        }
        .onAppear(perform: {
            if config.iPad {
                fs = CGFloat(16)
                width = CGFloat(720)
            } else {
                fs = CGFloat(14)
                width = CGFloat(360)
            }
        })
    }
}
