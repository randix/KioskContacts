//
//  NoteiPhoneView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 11/6/21.
//

import SwiftUI

struct NoteView: View {
    
    @ObservedObject var contact = ContactModel.shared
    @ObservedObject var config = ConfigurationModel.shared
  
    var body: some View {
        
        VStack {
            if config.note {
                HStack(spacing: 3) {
                    Spacer().frame(width:config.leading)
                    Text("Note")
                        .frame(width: config.text, alignment: .trailing)
                    TextField("note", text: $contact.note)
                        .frame(width:config.width-config.text)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                       Spacer()
                }.frame(width:config.width)
            }
        }
    }
}

