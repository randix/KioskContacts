//
//  NameiPad.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/25/21.
//

import SwiftUI

struct NameiPadView: View {
    
    @ObservedObject var contact = Contact.shared
    @ObservedObject var config = Configuration.shared
    
    let leadingFrame = CGFloat(45)
    
    let fs = CGFloat(14)
    let fsTitle = CGFloat(18)
    let fsSubtitle = CGFloat(14)
    
    
    var body: some View {
        
        VStack {
            Spacer().frame(height:20)
           
            HStack {
                if config.personaltitle {
                    Group {
                        Spacer().frame(width:10)
                        Text("Title")
                            .font(.system(size: fs))
                            .frame(width: leadingFrame, alignment: .trailing)
                        TextField("Mr./Mrs./etc.", text: $contact.title)
                            .font(.system(size: fs))
                            .frame(width:80)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                        Spacer()
                    }
                }
            }.frame(width:700)
            
            HStack {
                Spacer().frame(width:10)
                Text("First")
                    .frame(width: leadingFrame, alignment: .trailing)
                    .font(.system(size: fs))
                TextField("First Name", text: $contact.firstname)
                    .font(.system(size: fs))
                    .frame(width:600)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                Spacer()
            }.frame(width:700)
            
            if config.middlename {
                HStack {
                    Spacer().frame(width:10)
                    Text("Middle")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("Middle Name", text: $contact.middlename)
                        .font(.system(size: fs))
                        .frame(width:600)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                    Spacer()
                }.frame(width:700)
            }
            
            if config.middleinitial {
                HStack {
                    Spacer().frame(width:10)
                    Text("MI")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("MI", text: $contact.middleinitial)
                        .font(.system(size: fs))
                        .frame(width:80)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                    Spacer()
                }.frame(width:700)
            }
            HStack {
                Spacer().frame(width:10)
                Text("Last")
                    .font(.system(size: fs))
                    .frame(width: leadingFrame, alignment: .trailing)
                TextField("Last Name", text: $contact.lastname)
                    .font(.system(size: fs))
                    .frame(width:600)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                Spacer()
            }.frame(width:700)
            
            
            if config.suffix {
                HStack {
                    
                    Spacer().frame(width:10)
                    Text("Suffix")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("Jr./etc.", text: $contact.suffix)
                        .font(.system(size: fs))
                        .frame(width:80)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                    Spacer()
                    
                }.frame(width:700)
            }
        }
    }
}
