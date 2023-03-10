//
//  BlueCoordinator.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-25.
//

import Foundation
import UIKit

final class BlueCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?
    var parent: RootCoordinator?
    var navigationController: UINavigationController
    private var useTheMainMerchCoordinator: Bool
    
    init(navigationController: UINavigationController, useTheMainMerchCoordinator: Bool) {
        self.navigationController = navigationController
        self.useTheMainMerchCoordinator = useTheMainMerchCoordinator
    }
    
    func start(animated: Bool) {
        let blueViewController = BlueViewController()
        viewControllerRef = blueViewController
        blueViewController.coordinator = self
        blueViewController.tabBarItem = UITabBarItem(title: "Blue", image: UIImage(systemName: "magnifyingglass.circle.fill"), selectedImage: nil)
        navigationController.pushViewController(blueViewController, animated: animated)
    }
    
    func products() {
        parent?.products(useTheMainMerchCoordinator: self.useTheMainMerchCoordinator)
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
    
    func cleanUpMerch() {
        parent?.cleanUpMerch()
    }
}
