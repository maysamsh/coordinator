//
//  LoginCoordinator.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-25.
//

import Foundation
import UIKit

final class LoginCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?
    var parent: AuthCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let loginViewController = LoginViewController()
        viewControllerRef = loginViewController
        loginViewController.coordinator = self
        navigationController.customPushViewController(viewController: loginViewController)
    }
    
    func register() {
        parent?.register(navigationController: navigationController, animated: true)
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
}
