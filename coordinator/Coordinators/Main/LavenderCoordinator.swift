//
//  LavenderCoordinator.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-25.
//

import Foundation
import UIKit

final class LavenderCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?
    
    var parent: RootCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let lavenderViewController = LavenderViewController()
        viewControllerRef = lavenderViewController
        lavenderViewController.coordinator = self
        lavenderViewController.tabBarItem = UITabBarItem(title: "Lavender", image: UIImage(systemName: "gear.circle.fill"), selectedImage: nil)
        navigationController.pushViewController(lavenderViewController, animated: animated)
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
    
    func login() {
        parent?.login()
    }
}
