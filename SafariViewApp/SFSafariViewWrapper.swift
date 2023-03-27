//
//  SFSafariViewWrapper.swift
//  SafariViewApp
//
//  Created by Simon Bestler on 24.03.23.
//

import SwiftUI
import SafariServices
import Foundation

struct SFSafariView: UIViewControllerRepresentable {

    let url : URL

    func makeUIViewController(context: Context) -> some UIViewController {

        var configuration = SFSafariViewController.Configuration()
        configuration.barCollapsingEnabled = true
        var viewController = SFSafariViewController(url: url, configuration: configuration)
        viewController.preferredBarTintColor = .systemBackground
        viewController.modalPresentationStyle = UIModalPresentationStyle.currentContext

        viewController.dismissButtonStyle = SFSafariViewController.DismissButtonStyle.cancel
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        return
    }

    enum DismissButtonStyle {
        case cancel, close, done
    }

}
