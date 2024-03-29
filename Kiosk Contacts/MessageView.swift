//
//  MessageView.swift
//  kiosk
//
//  Created by Rand Dow on 10/22/21.
//

import SwiftUI
import MessageUI
import UIKit

struct MessageView: UIViewControllerRepresentable {
    
    @ObservedObject var config = ConfigurationModel.shared
    
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MessageComposeResult, Error>?
    
    @ObservedObject var contact = ContactModel.shared
    
    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MessageComposeResult, Error>?
        
        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MessageComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }
        
        func messageComposeViewController(_ controller: MFMessageComposeViewController,
                                          didFinishWith result: MessageComposeResult) {
            switch (result.rawValue) {
            case MessageComposeResult.cancelled.rawValue:
                print("Message was cancelled")
            case MessageComposeResult.failed.rawValue:
                print("Message failed")
            case MessageComposeResult.sent.rawValue:
                print("Message was sent")
            default:
                break;
            }
            ContactModel.shared.clear()
            
            defer {
                $presentation.wrappedValue.dismiss()
            }
            
            //            guard error == nil else {
            //                self.result = .failure(error!)
            //                return
            //            }
            self.result = .success(result)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation, result: $result)
    }
    
    func makeUIViewController(context: Context) -> MFMessageComposeViewController {
        let messageVC = MFMessageComposeViewController()
        let sub = Substitute()
        messageVC.body = sub.substitute(config.messageContents);
        messageVC.recipients = [ContactModel.shared.phone]
        messageVC.messageComposeDelegate = context.coordinator;
        return messageVC
    }
    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: Context) {
    }
}
