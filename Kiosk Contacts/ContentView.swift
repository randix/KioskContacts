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
    let fsTitle = CGFloat(18)
    let fsSubtitle = CGFloat(14)
    
    let leadingFrame = CGFloat(45)
    
    @State var device = SizeClass.iPhonePortrait
    let myWidth = 370
    
    @State var showSheet = false
    @State var resultMail: Result<MFMailComposeResult, Error>?
    
    var body: some View {
        VStack(spacing:2) {
            Group {
                Spacer().frame(height:20)
                Image(uiImage: config.iconImage!)
                    .resizable()
                    .scaledToFit()
                    .frame(width:350, height: 60)
                Spacer().frame(height:10)
                Text(config.title)
                    .font(.system(size: fsTitle))
                    .bold()
                Text(config.subtitle)
                    .font(.system(size: fsSubtitle))
                    .bold()
                Spacer().frame(height:20)
            }
      
            Group {
                if config.personaltitle {
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
                        Spacer().frame(width: CGFloat(myWidth - 20 - 60) - leadingFrame)
                    }
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
                    Spacer().frame(width: CGFloat(myWidth - 20 - 200) - leadingFrame)
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
                        Spacer().frame(width: CGFloat(myWidth - 20 - 200) - leadingFrame)
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
                        Spacer().frame(width: CGFloat(myWidth - 20 - 60) - leadingFrame)
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
                    Spacer().frame(width: CGFloat(myWidth - 20 - 200) - leadingFrame)
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
                    Spacer().frame(width: CGFloat(myWidth - 20 - 50) - leadingFrame)
                }
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
        .onAppear(perform: {
            device = config.sizeClass()
        })
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


