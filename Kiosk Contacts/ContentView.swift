//
//  ContentView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/23/21.
//

import SwiftUI
import MessageUI

struct ContentView: View {
    
    @ObservedObject var contact = ContactModel.shared
    @ObservedObject var config = ConfigurationModel.shared
    
    @State var showConfig = false
    @State var showSheetMail = false
    @State var resultMail: Result<MFMailComposeResult, Error>?
    @State var showSheetMessage = false
    @State var resultMessage: Result<MessageComposeResult, Error>?
    
    var body: some View {
        
        VStack(spacing:1) {
            
            HeaderView(showConfig: $showConfig)
            
            ScrollView {
                Group {
                    NameView()
                    ContactView()
                    AddressView()
                    NoteView()
                }
                
                Spacer().frame(height: 10)
                Button(action: {
                    contact.add()
                    if config.mailsend && contact.mail != "" {
                        showSheetMail = true
                    } else if config.messagesend && contact.phone != "" {
                        showSheetMessage = true
                    } else {
                        ContactModel.shared.clear()
                    }
                    // dismiss keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Submit")
                        .bold()
                }
                
                Spacer()
                Spacer().frame(height: 10)
                Text(config.app)
                    .font(.system(size: 9))
                Text("For info, see: Files App: On My " + (config.iPad ? "iPad" : "iPhone") + " / Kiosk Contacts / README")
                    .font(.system(size: 9))
                Text("Copyright © 2021-2022 Randix LLC. All rights reserved.")
                    .font(.system(size: 9))
                Spacer().frame(height: 10)
            }
        }
        .sheet(isPresented: $showSheetMail, content: { MailView(result: $resultMail) })
        .sheet(isPresented: $showSheetMessage, content: { MailView(result: $resultMail) })
        .sheet(isPresented: $showConfig, content: { ConfigView() })
    }
}
