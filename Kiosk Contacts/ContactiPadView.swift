//
//  ContactiPadView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/25/21.
//

import SwiftUI

struct ContactiPadView: View {
    
    @ObservedObject var contact = Contact.shared
    @ObservedObject var config = Configuration.shared
    
    let leadingFrame = CGFloat(45)
    
    let fs = CGFloat(14)
    let fsTitle = CGFloat(18)
    let fsSubtitle = CGFloat(14)
    
    var body: some View {
        
        VStack {
            
            Spacer().frame(height:20)
            
            if config.mailaddress {
                HStack {
                    Spacer().frame(width:20)
                    Text("Mail")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("john@example.com", text: $contact.mail)
                        .font(.system(size: fs))
                        .frame(width:600)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        .keyboardType(.emailAddress)
                        .autocapitalization(UITextAutocapitalizationType.none)
                    Spacer()
                }.frame(width:700)
            }
            
            if config.phone {
                HStack {
                    Spacer().frame(width:20)
                    Text("Phone")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("999-999-9999", text: $contact.phone)
                        .font(.system(size: fs))
                        .frame(width:600)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        .keyboardType(.numbersAndPunctuation)
                    Spacer()
                }.frame(width:700)
            }
            
            if config.organization {
                HStack {
                    Spacer().frame(width:20)
                    Text("Organization")
                        .font(.system(size: fs))
                        .frame(width:85, alignment: .leading)
                    TextField("Organization", text: $contact.organization)
                        .font(.system(size: fs))
                        .frame(width:560)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    Spacer()
                }.frame(width:700)
            }
            
        }
    }
}

