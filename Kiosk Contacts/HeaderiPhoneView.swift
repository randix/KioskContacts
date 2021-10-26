//
//  HeaderiPhoneView.swift
//  Kiosk Contacts
//
//  Created by Rand Dow on 10/25/21.
//

import SwiftUI

struct HeaderiPhoneView: View {
    
    let config = Configuration.shared
    
    let fs = CGFloat(14)
    let fsTitle = CGFloat(18)
    let fsSubtitle = CGFloat(14)
    
    var body: some View {
        Group {
            Spacer().frame(height:20)
            
            Image(uiImage: config.iconImage!)      // iPad 700 x 130, iPhone 350 x 60
                .resizable()
                .scaledToFit()
                .frame(width:350, height: 60)
            
            Spacer().frame(height:10)
            
            Text(config.title)
                .font(.system(size: 18))
                .bold()
            
            Text(config.subtitle)
                .font(.system(size: 14))
                .bold()
        }
    }
}
