//
//  CommonTextCoordinator.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-27.
//

import Foundation
import UIKit

final class CommonTextCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?
    var parent: ParentCoordinator?
    
    var navigationController: UINavigationController
    private var text: String?
    
    init(text: String?, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.text = text
    }
    
    func start(animated: Bool) {
        let textViewerViewController = TextViewerViewController()
        textViewerViewController.text = self.text
        viewControllerRef = textViewerViewController
        textViewerViewController.coordinator = self
        navigationController.pushViewController(textViewerViewController, animated: animated)
    }
    
    func coordinatorDidFinish() {
        if let parent = parent as? RootCoordinator {
            parent.childDidFinish(self)
        }
    }
}

