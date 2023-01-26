//
//  RegisterCoordinator.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-26.
//

import Foundation
import UIKit

final class RegisterCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?
    var parent: AuthCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let registerViewController = RegisterViewController()
        viewControllerRef = registerViewController
        registerViewController.coordinator = self
        navigationController.pushViewController(registerViewController, animated: animated)
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
    
    func forgotPassword() {
        parent?.forgotPassword(navigationController: navigationController, animated: true)
    }
    
    func dismissAuthScreen() {
        parent?.dismissAuthScreens()
    }
}

