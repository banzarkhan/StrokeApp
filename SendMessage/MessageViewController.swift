//
//  File.swift
//  
//
//  Created by Ariuna Banzarkhanova on 14/04/23.
//

import UIKit
import MessageUI
import SwiftUI

class MessageViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if MFMessageComposeViewController.canSendText() {
            displayMessageInterface()
        } else {
            print("Device cannot send SMS messages")
        }
    }
    
    func displayMessageInterface() {
        let messageVC = MFMessageComposeViewController()
        messageVC.body = "I'm experiencing a stroke and require assistance."
        messageVC.recipients = ["112","911"]
        messageVC.messageComposeDelegate = self
        self.present(messageVC, animated: true, completion: nil)
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case .cancelled:
            print("Message was cancelled")
        case .failed:
            print("Message failed to send")
        case .sent:
            print("Message was sent")
        default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

struct HostedMessageViewController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> MessageViewController {
        return MessageViewController()
        }

        func updateUIViewController(_ uiViewController: MessageViewController, context: Context) {
        }
}
