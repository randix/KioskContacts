//
//  ConfigView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/29/21.
//

import SwiftUI

struct ConfigView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var config = Configuration.shared
    
    let files = [
        "settings.txt",
        "mail.txt",
        "subject.txt",
        "sender.txt",
        "message.txt"
    ]
    @State var fileSelector = 0
    
    @State var pin = ""
    @State var master = false
    
    @State var textOriginal = ""
    @State var text = ""
    @State var color = Color.gray
    
    var body: some View {
        VStack {
            Group {
                Spacer().frame(height: 20)
                
                // chevron down
                HStack {
                    Spacer().frame(minWidth: 0)
                    Image(systemName: "chevron.compact.down").resizable().frame(width: 35, height: 12).opacity(0.3)
                    Spacer().frame(minWidth: 0)
                }
                Spacer().frame(height: 20)
                
                // Title
                HStack {
                    Spacer()
                    Text("Editor").font(.system(size: 20)).bold()
                    Spacer()
                }
                Spacer().frame(height:20)
            }
            
            HStack {
                Spacer()
                Image(systemName: "123.rectangle").font(.system(size: 18)).frame(width: 30)
                SecureField("pin", text:$pin)
                    .font(.system(size: 18))
                    .frame(width:70)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                    .keyboardType(.numberPad)
                Button(action: {
                    master = config.pin == pin
                    pin = ""
                    if master == false {
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Image(systemName: "checkmark").font(.system(size: 18)).frame(width: 30)
                }
                Spacer()
            }
            
            if master {
                HStack {
                    Spacer()
                    Text("Edit File:")
                        .font(.system(size:16))
                    Picker("Files", selection: $fileSelector, content: {
                        ForEach(0..<files.count, id: \.self) {
                            Text(files[$0])
                                .font(.system(size:16))
                        }
                    })
                        .pickerStyle(MenuPickerStyle())
                        .frame(width: 100, alignment: .leading)
                        .onChange(of: fileSelector) { _ in
                            loadFile()
                        }
                    Spacer()
                }
                Spacer().frame(height: 20)
                
                HStack {
                    Spacer().frame(width:30)
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                            .font(.system(size:16))
                    }
                    Spacer().frame(width:50)
                    Button(action: {
                        saveFile()
                        config.readConfig()
                        color = Color.gray
                    }) {
                        Text("Save")
                            .font(.system(size:16))
                    }
                    Spacer()
                    Text("Modified")
                        .font(.system(size:16))
                        .foregroundColor(color)
                    Spacer().frame(width:30)
                }
                HStack {
                    Spacer().frame(width:20)
                    TextEditor(text: $text)
                        .textFieldStyle(.roundedBorder)
                        .border(.black)
                        .onChange(of: text) { _ in
                            if text == textOriginal {
                                color = Color.gray
                            } else {
                                color = Color.red
                            }
                        }
                    Spacer().frame(width:20)
                }
            }
            
            Spacer()
        }
        .onAppear(perform: {
            loadFile()
        })
    }
    
    func loadFile() {
        let url = config.docDir.appendingPathComponent(files[fileSelector])
        try? text = String(contentsOf: url)
        textOriginal = text
    }
    
    func saveFile() {
        let url = config.docDir.appendingPathComponent(files[fileSelector])
        try? text.write(toFile: url.path, atomically: true, encoding: .utf8)
        textOriginal = text
    }
}
