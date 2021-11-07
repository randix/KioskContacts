//
//  NameiPhone.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/25/21.
//

import SwiftUI

struct NameView: View {
    
    @ObservedObject var contact = Contact.shared
    @ObservedObject var config = Configuration.shared
    
    @State var width = CGFloat(360)
    @State var fs = CGFloat(14)
   
    var body: some View {
        Group {
            Spacer().frame(height:10)
            
            if config.title {
                HStack {
                    Spacer().frame(width:10)
                    Text("Title")
                        .font(.system(size: fs))
                        .frame(width: config.leadingFrame, alignment: .trailing)
                    TextField("Mr. …", text: $contact.title)
                        .autocapitalization(.words)
                        .font(.system(size: fs))
                        .frame(width:80)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                    Spacer()
                }.frame(width:width)
            }
            
            HStack {
                Spacer().frame(width:10)
                Text("First")
                    .frame(width: config.leadingFrame, alignment: .trailing)
                    .font(.system(size: fs))
                TextField("First Name", text: $contact.firstname)
                    .autocapitalization(.words)
                    .font(.system(size: fs))
                    .frame(width:width-70)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 0)
                    .lineLimit(1).minimumScaleFactor(0.6)
                Spacer()
            }.frame(width:width)
            
            if config.middlename {
                HStack {
                    Spacer().frame(width:10)
                    Text("Middle")
                        .font(.system(size: fs))
                        .frame(width: config.leadingFrame, alignment: .trailing)
                    TextField("Middle Name", text: $contact.middlename)
                        .autocapitalization(.words)
                        .font(.system(size: fs))
                        .frame(width:width-70)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1).minimumScaleFactor(0.6)
                    Spacer()
                }.frame(width:width)
            }
            
            if config.middleinitial {
                HStack {
                    Spacer().frame(width:10)
                    Text("MI")
                        .font(.system(size: fs))
                        .frame(width: config.leadingFrame, alignment: .trailing)
                    TextField("MI", text: $contact.middleinitial)
                        .autocapitalization(.words)
                        .font(.system(size: fs))
                        .frame(width:80)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1).minimumScaleFactor(0.6)
                    Spacer()
                }.frame(width:width)
            }
            
            HStack {
                Spacer().frame(width:10)
                Text("Last")
                    .font(.system(size: fs))
                    .frame(width: config.leadingFrame, alignment: .trailing)
                TextField("Last Name", text: $contact.lastname)
                    .autocapitalization(.words)
                    .font(.system(size: fs))
                    .frame(width:width-70)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 0)
                    .lineLimit(1).minimumScaleFactor(0.6)
                Spacer()
            }.frame(width:width)
            
            if config.suffix {
                HStack {
                    Spacer().frame(width:10)
                    Text("Suffix")
                        .font(.system(size: fs))
                        .frame(width: config.leadingFrame, alignment: .trailing)
                    TextField("Jr. …", text: $contact.suffix)
                        .autocapitalization(.words)
                        .font(.system(size: fs))
                        .frame(width:80)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1).minimumScaleFactor(0.6)
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
