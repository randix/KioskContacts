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
    
    //typealias UIViewControllerType = MFMessageComposeViewController
    
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MessageComposeResult, Error>?
    
    @ObservedObject var contact = Contact.shared
    
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
                Contact.shared.clear()
            default:
                break;
            }
            
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
        let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = docDir.appendingPathComponent("file.txt")
        try? "hello".write(to: fileURL, atomically: false, encoding: .utf8)
        let messageVC = MFMessageComposeViewController()
        messageVC.body = "Hello <firstname>, Thank you for signing up at the Village Missions <event>.";
        messageVC.recipients = [Contact.shared.phone]
        messageVC.messageComposeDelegate = context.coordinator;
        return messageVC
    }
    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: Context) {
    }
}

