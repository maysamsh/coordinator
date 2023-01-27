//
//  ProductsCoordinator.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-27.
//

import Foundation
import UIKit

final class ProductsCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?
    var parent: MerchCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let productsCoordinator = ProductsViewController()
        viewControllerRef = productsCoordinator
        productsCoordinator.coordinator = self
        navigationController.pushViewController(productsCoordinator, animated: animated)
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
    
    func product(ID: String?) {
        parent?.square(productID: ID, navigationController: navigationController, animated: true)
    }
    
    func dismissAuthScreen() {
        parent?.dismissMerchScreens()
    }
}

