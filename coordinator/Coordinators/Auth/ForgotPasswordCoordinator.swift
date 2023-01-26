//
//  ForgotPasswordCoordinator.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-26.
//

import Foundation
import UIKit

final class ForgotPasswordCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?
    var parent: AuthCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let forgotPasswordViewController = ForgotPasswordViewController()
        viewControllerRef = forgotPasswordViewController
        forgotPasswordViewController.coordinator = self
        navigationController.pushViewController(forgotPasswordViewController, animated: animated)
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
    
    func dismissAuthScreen() {
        parent?.dismissAuthScreens()
    }
}

