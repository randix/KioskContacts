//
//  MailView.swift
//  kiosk
//
//  Created by Rand Dow on 10/22/21.
//

import SwiftUI
import MessageUI
import UIKit

struct MailView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    @ObservedObject var contact = Contact.shared
    @ObservedObject var config = Configuration.shared
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            print(error?.localizedDescription ?? "error nil")
            switch (result.rawValue) {
            case MFMailComposeResult.cancelled.rawValue:
                print("Mail was cancelled")
            case MFMailComposeResult.failed.rawValue:
                print("Mail failed")
            case MFMailComposeResult.sent.rawValue:
                print("Mail was sent")
                Contact.shared.clear()
            default:
                break;
            }
            
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation, result: $result)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()

        let sub = Substitute()
        vc.setSubject(sub.substitute(config.subject))
        vc.setToRecipients([contact.mail])
        vc.setPreferredSendingEmailAddress(config.from)
        vc.setMessageBody(sub.substitute(config.mailContents), isHTML: false)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
    }
}
