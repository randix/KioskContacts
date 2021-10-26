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
    
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPhoneFocused: Bool
    @State var key = CGFloat(0)
    
    let iPad = UIScreen.main.bounds.width > 600
    let myWidth = 375
    
    let fs = CGFloat(14)
    let fsTitle = CGFloat(18)
    let fsSubtitle = CGFloat(14)
    
    let leadingFrame = CGFloat(45)
    
    @State var showSheetMail = false
    @State var resultMail: Result<MFMailComposeResult, Error>?
    @State var showSheetMessage = false
    @State var resultMessage: Result<MessageComposeResult, Error>?
    
    var body: some View {
        
        VStack(spacing:2) {
            if iPad {
                HeaderiPadView()
            } else {
                HeaderiPhoneView()
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
                    showSheetMail = true
                    contact.add()
                    // TODO: dismiss keyboard
                }) {
                    Text("Submit")
                        .font(.system(size: fs+2)).bold()
                }
                
                Spacer()
            }
        }
        .sheet(isPresented: $showSheetMail, content: { MailView(result: $resultMail) })
        .sheet(isPresented: $showSheetMessage, content: { MailView(result: $resultMail) })
    }
}
