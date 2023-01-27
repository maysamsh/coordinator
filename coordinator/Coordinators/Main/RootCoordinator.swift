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
    /// A reference to `BaseTabBarController` to hide its navigation controller after dismissing Auth screens
    var baseTabBarController: BaseTabBarController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        baseTabBarController = BaseTabBarController(coordinator: self)
        baseTabBarController!.coordinator = self
        navigationController.pushViewController(baseTabBarController!, animated: animated)
    }
}
