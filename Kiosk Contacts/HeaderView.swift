//
//  HeaderiPhoneView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/25/21.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var showConfig: Bool
    
    @ObservedObject var config = Configuration.shared
    // iPhone sizes
    @State var iconWidth = CGFloat(350)
    @State var iconHeight = CGFloat(60)
    @State var fsTitle = CGFloat(18)
    @State var fsSubtitle = CGFloat(14)
    
    var body: some View {
        Group {
            Spacer().frame(height:10)
            
            Button(action: {
                config.setupCount += 1
                if config.setupCount > 3 {
                    showConfig = true
                    config.setupCount = 0
                }
            }) {
                Image(uiImage: config.iconImage!)  
                    .resizable()
                    .scaledToFit()
                    .frame(width:iconWidth, height: iconHeight)
            }
            
            Spacer().frame(height:10)
            
            Text(config.kiosktitle)
                .font(.system(size: fsTitle))
                .bold()
            
            Text(config.subtitle)
                .font(.system(size: fsSubtitle))
                .bold()
        }
        .onAppear(perform: {
            if config.iPad {
                iconWidth = CGFloat(700)
                iconHeight = CGFloat(120)
                fsTitle = CGFloat(20)
                fsSubtitle = CGFloat(16)
            } else {
                iconWidth = CGFloat(350)
                iconHeight = CGFloat(60)
                fsTitle = CGFloat(18)
                fsSubtitle = CGFloat(14)
            }
        })
    }
}
