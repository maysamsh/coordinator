//
//  MerchCoordinator.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-27.
//

import Foundation
import UIKit

final class MerchCoordinator: ParentCoordinator {
    var parent: RootCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool = false) {
        /// Merch Coordinator Inittilization
    }
    
    func dismissMerchScreens() {
        let lastCoordinator = childCoordinators.popLast()
        for item in childCoordinators.reversed() {
            if item is ChildCoordinator {
                let childCoordinator = item as! ChildCoordinator
                if let viewController = childCoordinator.viewControllerRef as? DisposableViewController {
                    viewController.cleanUp()
                }
                childCoordinator.viewControllerRef?.navigationController?.popViewController(animated: false)
                self.childDidFinish(childCoordinator)
            }
        }
        lastCoordinator?.popViewController(animated: true, useCustomAnimation: false)
        navigationController.customPopToRootViewController()
    }
}
