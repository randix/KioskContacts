//
//  NoteiPhoneView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 11/6/21.
//

import SwiftUI

struct NoteiPhoneView: View {
    
    @ObservedObject var contact = Contact.shared
    @ObservedObject var config = Configuration.shared
    
    let leadingFrame = CGFloat(45)
    
    let fs = CGFloat(14)
    let fsTitle = CGFloat(18)
    let fsSubtitle = CGFloat(14)
    
    var body: some View {
        
        VStack {
            if config.note {
                HStack {
                    Spacer().frame(width:20)
                    Text("Note")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("note", text: $contact.note)
                        .font(.system(size: fs))
                        .frame(width:280)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                       Spacer()
                }.frame(width:360)
            }
        }
    }
}

