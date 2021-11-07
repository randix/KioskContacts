//
//  NoteiPhoneView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 11/6/21.
//

import SwiftUI

struct NoteView: View {
    
    @ObservedObject var contact = Contact.shared
    @ObservedObject var config = Configuration.shared
    
    @State var width = CGFloat(360)
    @State var fs = CGFloat(14)
    
    var body: some View {
        
        VStack {
            if config.note {
                HStack {
                    Spacer().frame(width:10)
                    Text("Note")
                        .font(.system(size: fs))
                        .frame(width: config.leadingFrame, alignment: .trailing)
                    TextField("note", text: $contact.note)
                        .font(.system(size: fs))
                        .frame(width:width-75)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
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

