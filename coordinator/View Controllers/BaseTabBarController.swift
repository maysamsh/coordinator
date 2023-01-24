//
//  BaseTabBarController.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2022-11-12.
//

import UIKit

final class BaseTabBarController: UITabBarController {
    weak var coordinator: RootCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let whiteViewController = WhiteViewController()
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        
        viewControllers = [whiteViewController, whiteViewController]
    }

}
