//
//  RootCoordinator.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2022-11-12.
//

import Foundation
import UIKit

class RootCoordinator: NSObject, Coordinator, ParentCoordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let baseTabBarConreoller = BaseTabBarController()
        baseTabBarConreoller.coordinator = self
        navigationController.pushViewController(baseTabBarConreoller, animated: animated)
    }
}
