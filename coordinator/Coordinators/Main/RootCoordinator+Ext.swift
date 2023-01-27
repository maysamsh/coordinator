//
//  RootCoordinator+Ext.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-24.
//

import Foundation
import UIKit

extension RootCoordinator {
    func greenScreen(navigationController: UINavigationController, animated: Bool) {
        let greenCoordinator = GreenCoordinator(navigationController: navigationController)
        greenCoordinator.parent = self
        addChild(greenCoordinator)
        greenCoordinator.start(animated: animated)
    }
    
    func blueScreen(navigationController: UINavigationController, animated: Bool) {
        let blueCoordinator = BlueCoordinator(navigationController: navigationController)
        blueCoordinator.parent = self
        addChild(blueCoordinator)
        blueCoordinator.start(animated: animated)
    }
    
    func lavenderScreen(navigationController: UINavigationController, animated: Bool) {
        let lavenderCoordinator = LavenderCoordinator(navigationController: navigationController)
        lavenderCoordinator.parent = self
        addChild(lavenderCoordinator)
        lavenderCoordinator.start(animated: animated)
    }
    
    func commonText(text: String?, navigationController: UINavigationController, animated: Bool) {
        let commonTextCoordinator = CommonTextCoordinator(text: text, navigationController: navigationController)
        commonTextCoordinator.parent = self
        addChild(commonTextCoordinator)
        commonTextCoordinator.start(animated: animated)
    }
    
    //MARK: - Auth
    func login() {
        for child in childCoordinators {
            if child is AuthCoordinator {
                let authCoordinator = child as! AuthCoordinator
                /// Showing the navigation bar for Auth screens
                navigationController.setNavigationBarHidden(false, animated: false)
                authCoordinator.login(navigationController: navigationController, animated: true)
            }
        }
    }
    
    // MARK: - Merch
    func products() {
        var blueNavigationController: UINavigationController?
        for child in childCoordinators {
            if child is BlueCoordinator {
                blueNavigationController = child.navigationController
            }
        }
        
        for child in childCoordinators {
            if child is MerchCoordinator, let blueNavigationController {
                let merchCoordinator = child as! MerchCoordinator
                /// If you want to use the main navigation controller, you can use `navigationController` which will replace the entire screen
                /// If you want this behaviour, you can get rid of extra `setNavigationBarHidden(_ ,animated:)` calls 
                merchCoordinator.products(navigationController: blueNavigationController, animated: true)
            }
        }
    }
}
