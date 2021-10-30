//
//  ContentView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/23/21.
//

import SwiftUI
import MessageUI

struct ContentView: View {
    
    @ObservedObject var contact = Contact.shared
    @ObservedObject var config = Configuration.shared
    
    let iPad = UIScreen.main.bounds.width > 600
    let myWidth = 375
    
    let fs = CGFloat(14)
    let fsTitle = CGFloat(18)
    let fsSubtitle = CGFloat(14)
    
    let leadingFrame = CGFloat(45)
    
    @State var showConfig = false
    @State var showSheetMail = false
    @State var resultMail: Result<MFMailComposeResult, Error>?
    @State var showSheetMessage = false
    @State var resultMessage: Result<MessageComposeResult, Error>?
    
    var body: some View {
        
        VStack(spacing:1) {
            
            if iPad {
                HeaderiPadView(showConfig: $showConfig)
            } else {
                HeaderiPhoneView(showConfig: $showConfig)
            }
        
            ScrollView {
                if iPad {
                    NameiPadView()
                    ContactiPadView()
                    AddressiPadView()
                   
                } else {
                    NameiPhoneView()
                    ContactiPhoneView()
                    AddressiPhoneView()
                }
                
                Spacer().frame(height: 20)
                Button(action: {
                    contact.add()
                    if config.mailsend && contact.mail != "" {
                        showSheetMail = true
                    } else if config.messagesend && contact.phone != "" {
                        showSheetMessage = true
                    }
                    // dismiss keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Submit")
                        .font(.system(size: fs+2)).bold()
                }
                
                Spacer()
                Spacer().frame(height: 10)
                Text(config.app)
                    .font(.system(size: 9))
                Text("For info, see: Files App: On My " + (iPad ? "iPad" : "iPhone") + " / Kiosk Contacts / README")
                    .font(.system(size: 9))
                Text("Copyright © 2021 Randix LLC. All rights reserved.")
                    .font(.system(size: 9))
                Spacer().frame(height: 10)
            }
        }
        .sheet(isPresented: $showSheetMail, content: { MailView(result: $resultMail) })
        .sheet(isPresented: $showSheetMessage, content: { MailView(result: $resultMail) })
        .sheet(isPresented: $showConfig, content: { ConfigView() })
    }
}
