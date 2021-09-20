//
//  UIViewController+extension.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 20/09/2021.
//

import Foundation
import UIKit

extension UIViewController {
    func startActivityIndicator() {
        let activityIndicator = ActivityIndicatorScreen()
        activityIndicator.spinner.color = .systemBlue
        addChild(activityIndicator)
        activityIndicator.view.frame = view.frame
        view.addSubview(activityIndicator.view)
        activityIndicator.didMove(toParent: self)
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async {
            for child in self.children {
                if child is ActivityIndicatorScreen {
                    child.willMove(toParent: nil)
                    child.view.removeFromSuperview()
                    child.removeFromParent()
                }
            }
        }
    }
}
