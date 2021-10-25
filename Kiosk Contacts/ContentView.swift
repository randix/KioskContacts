//
//  ContentView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/23/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var contact = Contact.shared
    @ObservedObject var config = Configuration.shared
    
    let fs = CGFloat(14)
    let fsTitle = CGFloat(24)
    let fsSubtitle = CGFloat(18)
    
    let leadingFrame = CGFloat(45)
    
    var body: some View {
        VStack {
            Group {
                Spacer().frame(height:20)
                Text("icon").frame(width:350, height: 50)
                Text(config.title)
                    .font(.system(size: fsTitle))
                    .bold()
                Text(config.subtitle)
                    .font(.system(size: fsSubtitle))
                    .bold()
                Spacer().frame(height:20)
            }
        }
        VStack(alignment:.leading, spacing:2) {
            Group {
                HStack {
                    Text("Title")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("", text: $contact.title)
                        .font(.system(size: fs))
                        .frame(width:60)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                }
                HStack {
                    Text("First")
                        .frame(width: leadingFrame, alignment: .trailing)
                        .font(.system(size: fs))
                    TextField("", text: $contact.firstname)
                        .font(.system(size: fs))
                        .frame(width:200)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                }
                if config.middlename {
                    HStack {
                        Text("Middle")
                            .font(.system(size: fs))
                            .frame(width: leadingFrame, alignment: .trailing)
                        TextField("", text: $contact.middlename)
                            .font(.system(size: fs))
                            .frame(width:200)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                    }
                }
                if config.middleinitial {
                    HStack {
                        Text("MI")
                            .font(.system(size: fs))
                            .frame(width: leadingFrame, alignment: .trailing)
                        TextField("", text: $contact.middleinitial)
                            .font(.system(size: fs))
                            .frame(width:60)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                    }
                }
                HStack {
                    Text("Last")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("", text: $contact.lastname)
                        .font(.system(size: fs))
                        .frame(width:200)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                }
                
                HStack {
                    Text("Suffix")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("", text: $contact.suffix)
                        .font(.system(size: fs))
                        .frame(width:50)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                }
            }
            Spacer().frame(height:20)
            Group {
                Text("Address")
                    .font(.system(size: fs))
                TextField("address line 1", text: $contact.addressline1)
                    .font(.system(size: fs))
                    .frame(width:350)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                TextField("address line 2", text: $contact.addressline2)
                    .font(.system(size: fs))
                    .frame(width:350)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                HStack(spacing:2) {
                    TextField("city", text: $contact.city)
                        .font(.system(size: fs))
                        .frame(width:100)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    TextField("state", text: $contact.state)
                        .font(.system(size: fs))
                        .frame(width:100)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    TextField("zip", text: $contact.zipcode)
                        .font(.system(size: fs))
                        .frame(width:60)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        .keyboardType(.numberPad)
                    TextField("country", text: $contact.country)
                        .font(.system(size: fs))
                        .frame(width:70)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                }
            }
            
            Group {
                Spacer().frame(height:20)
                Text("Organization")
                    .font(.system(size: fs))
                TextField("organization", text: $contact.organization)
                    .font(.system(size: fs))
                    .frame(width:350)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                Spacer().frame(height:20)
                HStack {
                    Text("Phone")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("", text: $contact.phone)
                        .font(.system(size: fs))
                        .frame(width:150)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        .keyboardType(.numbersAndPunctuation)
                }
                
                HStack {
                    Text("Mail")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("", text: $contact.mail)
                        .font(.system(size: fs))
                        .frame(width:300)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        .keyboardType(.emailAddress)
                }
            }
        }
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
