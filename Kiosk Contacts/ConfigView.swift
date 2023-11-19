//
//  ConfigView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/29/21.
//

import SwiftUI

struct ConfigView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var config = ConfigurationModel.shared
    
    let files = [
        "settings.txt",
        "mail.txt",
        "message.txt"
    ]
    @State var fileSelector = 0
    
    @State var pin = ""
    @State var master = false
    
    @State var textOriginal = ""
    @State var text = ""
    @State var modified = false
    
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
                Spacer().frame(height:10)
            }
            
            if !master {
                HStack {
                    Spacer()
                    Image(systemName: "123.rectangle")
                        .frame(width: 30)
                    SecureField("pin", text:$pin)
                        .frame(width:70)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 0).lineLimit(1).minimumScaleFactor(0.4)
                        .keyboardType(.numberPad)
                        .onChange(of: pin, perform: { _ in
                            if !master {
                                master = config.pin == pin
                                if master {
                                    pin = ""
                                }
                            }
                        })
                    Spacer()
                }
                
            } else {
                
                HStack {
                    Spacer()
                    Text("Edit File:")
                    Picker("Files", selection: $fileSelector, content: {
                        ForEach(0..<files.count, id: \.self) {
                            Text(files[$0])
                        }
                    })
                        .pickerStyle(MenuPickerStyle())
                        .frame(width: 150, alignment: .leading)
                        .onChange(of: fileSelector) { _ in
                            loadFile()
                        }
                    Spacer()
                }
                Spacer().frame(height: 10)
                
                
                
                HStack {
                    Spacer().frame(width:20)
                    TextEditor(text: $text)
                        .textFieldStyle(.roundedBorder)
                        .border(.black)
                        .onChange(of: text) { _ in
                            if text == textOriginal {
                                modified = false
                            } else {
                                modified = true
                            }
                        }
                    Spacer().frame(width:20)
                }
                
                HStack {
                    Spacer().frame(width:60)
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        VStack {
                            Image(systemName: "arrow.uturn.backward").font(.system(size:24))
                            Text("Cancel")
                        }
                    }
                    Spacer().frame(width:40)
                    Button(action: {
                        saveFile()
                        config.configChanged = true
                        config.readConfig()
                        modified = false
                    }) {
                        VStack {
                            Image(systemName: "square.and.arrow.down").font(.system(size:24))
                            if modified {
                                Text("Save").bold()
                            } else {
                                Text("Save")
                            }
                        }
                    }
                    .disabled(!modified)
                    
                    Spacer()
                    Button(action: {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }) {
                        VStack {
                            Image(systemName: "keyboard.chevron.compact.down").font(.system(size:20))
                        }
                    }
                    Spacer().frame(width:30)
                }
            }
            
            Spacer()
        }
        .onAppear(perform: {
            loadFile()
            master = false
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
