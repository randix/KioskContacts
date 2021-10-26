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
 
    @State var showSheet = false
    @State var resultMail: Result<MFMailComposeResult, Error>?
    
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
            } else {
                NameiPhoneView()
            }
      
            Spacer().frame(height:10)
            Group {
                HStack {
                    Spacer().frame(width:20)
                    Text("Address")
                        .font(.system(size: fs))
                        .frame(width:60, alignment: .leading)
                    Spacer().frame(width: CGFloat(myWidth - 20 - 70))
                }
                HStack {
                    Spacer().frame(width:20)
                    TextField("line 1", text: $contact.addressline1)
                        .font(.system(size: fs))
                        .frame(width:350)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    Spacer().frame(width: CGFloat(myWidth - 20 - 350))
                }
                if config.addressline2 {
                    HStack {
                        Spacer().frame(width:20)
                        TextField("line 2", text: $contact.addressline2)
                            .font(.system(size: fs))
                            .frame(width:350)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        Spacer().frame(width: CGFloat(myWidth - 20 - 350))
                    }
                }
                HStack(spacing:2) {
                    Spacer().frame(width:20)
                    TextField("city", text: $contact.city)
                        .font(.system(size: fs))
                        .frame(width:120)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    TextField("state", text: $contact.state)
                        .font(.system(size: fs))
                        .frame(width:69)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    TextField("zip", text: $contact.zipcode)
                        .font(.system(size: fs))
                        .frame(width:60)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        .keyboardType(.numberPad)
                    if config.country {
                        TextField("country", text: $contact.country)
                            .font(.system(size: fs))
                            .frame(width:90)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    }
                    //Spacer().frame(width: CGFloat(myWidth - 20 - 120 - 69 - 60 - 90))
                    Spacer()
                }
            }
            
            Group {
                Spacer().frame(height:10)
                if config.organization {
                    HStack {
                        Spacer().frame(width:20)
                        Text("Organization")
                            .font(.system(size: fs))
                            .frame(width:100, alignment: .leading)
                        Spacer().frame(width: CGFloat(myWidth - 20 - 350))
                    }
                    
                    HStack {
                        Spacer().frame(width:20)
                        
                        TextField("organization", text: $contact.organization)
                            .font(.system(size: fs))
                            .frame(width:350)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        Spacer()
                    }
                    Spacer().frame(height:10)
                }
                
                HStack {
                    Spacer().frame(width:20)
                    Text("Phone")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("", text: $contact.phone)
                        .font(.system(size: fs))
                        .frame(width:150)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        .keyboardType(.numbersAndPunctuation)
                        .focused($isPhoneFocused)
                    Spacer()
                }
                
                HStack {
                    Spacer().frame(width:20)
                    Text("Mail")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("", text: $contact.mail)
                        .font(.system(size: fs))
                        .frame(width:300)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        .keyboardType(.emailAddress)
                        .focused($isEmailFocused)
                    
                    Spacer()
                }
                .onChange(of: isEmailFocused) { newValue in
                    moveUp()
                }
                .onChange(of: isPhoneFocused) { newValue in
                    moveUp()
                }
            }
        }
        Spacer().frame(height: 20)
        Button(action: {
            showSheet = true
            contact.add()
            
        }) {
            Text("Submit")
                .font(.system(size: fs+2)).bold()
        }
        .sheet(isPresented: $showSheet, content: { MailView(result: $resultMail) })
      
        Spacer().frame(minHeight: key)
        Spacer()
        }
    }
        
    
    func moveUp() {
        key = 0
        if isEmailFocused {
            key = 200
        }
        if isPhoneFocused {
            key = 140
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


