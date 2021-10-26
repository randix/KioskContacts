//
//  ContactiPhoneView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/25/21.
//

import SwiftUI

struct ContactiPhoneView: View {
    
    @ObservedObject var contact = Contact.shared
    @ObservedObject var config = Configuration.shared
    
    let leadingFrame = CGFloat(45)
    
    let fs = CGFloat(14)
    let fsTitle = CGFloat(18)
    let fsSubtitle = CGFloat(14)
    
    var body: some View {
        
        VStack {
            
            Spacer().frame(height:10)
            
            if config.organization {
                HStack {
                    Spacer().frame(width:20)
                    Text("Organization")
                        .font(.system(size: fs))
                        .frame(width:100, alignment: .leading)
                    Spacer()
                }.frame(width:360)
                
                HStack {
                    Spacer().frame(width:20)
                    TextField("organization", text: $contact.organization)
                        .font(.system(size: fs))
                        .frame(width:320)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    Spacer()
                }.frame(width:360)
            }
            
            if config.phone {
                HStack {
                    Spacer().frame(width:20)
                    Text("Phone")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("", text: $contact.phone)
                        .font(.system(size: fs))
                        .frame(width:200)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        .keyboardType(.numbersAndPunctuation)
                    //.focused($isPhoneFocused)
                    Spacer()
                }.frame(width:360)
            }
            
            if config.mailaddress {
                HStack {
                    Spacer().frame(width:20)
                    Text("Mail")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("", text: $contact.mail)
                        .font(.system(size: fs))
                        .frame(width:280)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        .keyboardType(.emailAddress)
                    //.focused($isEmailFocused)
                    Spacer()
                }.frame(width:360)
            }
        }
    }
}

