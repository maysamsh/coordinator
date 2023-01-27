//
//  SquareCoordinator.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-27.
//

import Foundation
import UIKit

final class SquareCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?
    var parent: MerchCoordinator?
    var navigationController: UINavigationController
    private var productID: String?
    
    init(productID: String?, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.productID = productID
    }
    
    func start(animated: Bool) {
        let squareViewController = SquareViewController()
        squareViewController.productID = self.productID
        viewControllerRef = squareViewController
        squareViewController.coordinator = self
        navigationController.pushViewController(squareViewController, animated: animated)
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
    
    func terms(text: String?) {
        parent?.terms(text: text, navigationController: navigationController, animated: true)
    }
    
    func dismissAuthScreen() {
        parent?.dismissMerchScreens()
    }
}

