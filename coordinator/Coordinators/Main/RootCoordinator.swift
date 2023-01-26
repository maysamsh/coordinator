//
//  RootCoordinator.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2022-11-12.
//

import Foundation
import UIKit

final class RootCoordinator: NSObject, Coordinator, ParentCoordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let baseTabBarController = BaseTabBarController(coordinator: self)
        baseTabBarController.coordinator = self
        navigationController.pushViewController(baseTabBarController, animated: animated)
    }
}
