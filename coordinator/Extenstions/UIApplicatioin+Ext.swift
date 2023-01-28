//
//  UIApplicatioin+Ext.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-28.
//

import Foundation
import UIKit

extension UIApplication {
    func topViewController() -> UIViewController? {
        var topViewController: UIViewController? = nil
        if #available(iOS 13, *) {
            for scene in connectedScenes {
                if let windowScene = scene as? UIWindowScene {
                    for window in windowScene.windows {
                        if window.isKeyWindow {
                            topViewController = window.rootViewController
                        }
                    }
                }
            }
        } else {
            topViewController = keyWindow?.rootViewController
        }
        while true {
            if let presented = topViewController?.presentedViewController {
                topViewController = presented
            } else if let navController = topViewController as? UINavigationController {
                topViewController = navController.topViewController
            } else if let tabBarController = topViewController as? UITabBarController {
                topViewController = tabBarController.selectedViewController
            } else {
                /// Handle any other third party container in `else if` if required
                break
            }
        }
        return topViewController
    }
    
    func topNavigatioinController() -> UINavigationController? {
        return topViewController()?.navigationController
    }
}

