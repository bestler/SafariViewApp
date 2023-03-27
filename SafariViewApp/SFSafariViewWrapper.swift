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
    let dismissButtonStyle: DismissButtonStyle
    let preferredBarTintColor: UIColor?
    let preferredControlTintColor: UIColor?
    let isBarCollapsing: Bool
    let entersReaderIfAvailable: Bool

    init(url: URL,
         dismissButtonStyle: DismissButtonStyle = .done,
         preferredBarTintColor : UIColor? = .systemBackground,
         preferredControlTintColor : UIColor? = .tintColor,
         isBarCollapsing: Bool = true,
         entersReaderIfAvailable: Bool = false) {
        self.url = url
        self.dismissButtonStyle = dismissButtonStyle
        self.preferredBarTintColor = preferredBarTintColor
        self.preferredControlTintColor = preferredControlTintColor
        self.isBarCollapsing = isBarCollapsing
        self.entersReaderIfAvailable = entersReaderIfAvailable
    }

    func makeUIViewController(context: Context) -> some UIViewController {

        let configuration = SFSafariViewController.Configuration()
        configuration.barCollapsingEnabled = isBarCollapsing
        configuration.entersReaderIfAvailable = entersReaderIfAvailable

        let viewController = SFSafariViewController(url: url, configuration: configuration)

        viewController.modalPresentationStyle = UIModalPresentationStyle.currentContext

        //Setting the colors
        viewController.preferredBarTintColor = preferredBarTintColor
        viewController.preferredControlTintColor = preferredControlTintColor


        // Configure dismissButtonStyle
        switch dismissButtonStyle {
        case .cancel:
            viewController.dismissButtonStyle = SFSafariViewController.DismissButtonStyle.cancel
        case .close:
            viewController.dismissButtonStyle = SFSafariViewController.DismissButtonStyle.close
        case .done:
            viewController.dismissButtonStyle = SFSafariViewController.DismissButtonStyle.done
        }

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        return
    }

    enum DismissButtonStyle {
        case cancel, close, done
    }

}
