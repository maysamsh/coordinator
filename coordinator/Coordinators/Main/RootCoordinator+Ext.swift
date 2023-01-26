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
    
    //MARK: - Auth
    func login() {
        for child in childCoordinators {
            if child is AuthCoordinator {
                let authCoordinator = child as! AuthCoordinator
                authCoordinator.login(navigationController: navigationController, animated: true)
            }
        }
    }
}
