//
//  HeaderiPadView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/25/21.
//

import SwiftUI

struct HeaderiPadView: View {
    
    @Binding var showConfig: Bool
    
    @ObservedObject var config = Configuration.shared
    
    let fs = CGFloat(14)
    let fsTitle = CGFloat(18)
    let fsSubtitle = CGFloat(14)
    
    var body: some View {
        
        Group {
            Spacer().frame(height:20)
            
            Button(action: {
                config.setupCount += 1
                if config.setupCount > 3 {
                    showConfig = true
                    config.setupCount = 0
                }
            }) {
                Image(uiImage: config.iconImage!)      // iPad 700 x 130, iPhone 350 x 60
                    .resizable()
                    .scaledToFit()
                    .frame(width:700, height: 120)
            }
            
            Spacer().frame(height:10)
            
            Text(config.kiosktitle)
                .font(.system(size: 20))
                .bold()
            
            Text(config.subtitle)
                .font(.system(size: 16))
                .bold()
        }
    }
}
