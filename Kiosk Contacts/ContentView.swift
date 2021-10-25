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
    
    let fs = CGFloat(14)
    let fsTitle = CGFloat(24)
    let fsSubtitle = CGFloat(18)
    
    let leadingFrame = CGFloat(45)
    
    @State var showSheet = false
    @State var resultMail: Result<MFMailComposeResult, Error>?
    
    var body: some View {
        VStack {
            Group {
                Spacer().frame(height:20)
                Text("icon").frame(width:350, height: 50)
                Text(config.title)
                    .font(.system(size: fsTitle))
                    .bold()
                Text(config.subtitle)
                    .font(.system(size: fsSubtitle))
                    .bold()
                Spacer().frame(height:20)
            }
        }
        VStack(alignment:.leading, spacing:2) {
            Group {
                HStack {
                    Spacer().frame(width:20)
                    Text("Title")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("", text: $contact.title)
                        .font(.system(size: fs))
                        .frame(width:60)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                    Spacer()
                }
                HStack {
                    Spacer().frame(width:20)
                    Text("First")
                        .frame(width: leadingFrame, alignment: .trailing)
                        .font(.system(size: fs))
                    TextField("", text: $contact.firstname)
                        .font(.system(size: fs))
                        .frame(width:200)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                    Spacer()
                }
                if config.middlename {
                    HStack {
                        Spacer().frame(width:20)
                        Text("Middle")
                            .font(.system(size: fs))
                            .frame(width: leadingFrame, alignment: .trailing)
                        TextField("", text: $contact.middlename)
                            .font(.system(size: fs))
                            .frame(width:200)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                        Spacer()
                    }
                }
                if config.middleinitial {
                    HStack {
                        Spacer().frame(width:20)
                        Text("MI")
                            .font(.system(size: fs))
                            .frame(width: leadingFrame, alignment: .trailing)
                        TextField("", text: $contact.middleinitial)
                            .font(.system(size: fs))
                            .frame(width:60)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                        Spacer()
                    }
                }
                HStack {
                    Spacer().frame(width:20)
                    Text("Last")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("", text: $contact.lastname)
                        .font(.system(size: fs))
                        .frame(width:200)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                    Spacer()
                }
                
                HStack {
                    Spacer().frame(width:20)
                    Text("Suffix")
                        .font(.system(size: fs))
                        .frame(width: leadingFrame, alignment: .trailing)
                    TextField("", text: $contact.suffix)
                        .font(.system(size: fs))
                        .frame(width:50)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.6)
                    Spacer()
                }
            }
            Spacer().frame(height:20)
            Group {
                HStack {
                    Spacer().frame(width:20)
                    
                    Text("Address")
                        .font(.system(size: fs))
                    Spacer()
                }
                HStack {
                    Spacer().frame(width:20)
                    TextField("address line 1", text: $contact.addressline1)
                        .font(.system(size: fs))
                        .frame(width:350)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    Spacer()
                }
                HStack {
                    Spacer().frame(width:20)
                    TextField("address line 2", text: $contact.addressline2)
                        .font(.system(size: fs))
                        .frame(width:350)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    Spacer()
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
                    TextField("country", text: $contact.country)
                        .font(.system(size: fs))
                        .frame(width:90)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    Spacer()
                }
            }
            
            Group {
                Spacer().frame(height:20)
                HStack {
                    Spacer().frame(width:20)
                    Text("Organization")
                        .font(.system(size: fs))
                    Spacer()
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
                //.keyboardAdaptive()
                Spacer().frame(height:20)
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
                //.keyboardAdaptive()
                
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
        Button(action: {
            showSheet = true
            contact.add()
            
        }) {
            Text("Submit")
                .font(.system(size: fs)).bold()
        }
        .sheet(isPresented: $showSheet, content: { MailView(result: $resultMail) })
        Spacer().frame(minHeight: key)
        Spacer()
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


