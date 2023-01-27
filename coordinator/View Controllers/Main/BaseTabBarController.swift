//
//  BaseTabBarController.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2022-11-12.
//

import UIKit

final class BaseTabBarController: UITabBarController {
    var coordinator: RootCoordinator?

    let authCoordinator = AuthCoordinator(navigationController: UINavigationController())
    let merchCoordinator = MerchCoordinator(navigationController: UINavigationController())
    let greenCoordinator = GreenCoordinator(navigationController: UINavigationController())

    let blueCoordinator = BlueCoordinator(navigationController: UINavigationController())
    let lavenderCoordnator = LavenderCoordinator(navigationController: UINavigationController())
    
    init(coordinator: RootCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: "BaseTabBarController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        
        authCoordinator.parent = coordinator
        merchCoordinator.parent = coordinator
        greenCoordinator.parent = coordinator
        blueCoordinator.parent = coordinator
        lavenderCoordnator.parent = coordinator
        
        for item in [authCoordinator, merchCoordinator, greenCoordinator, blueCoordinator, lavenderCoordnator] {
            coordinator?.addChild(item as? Coordinator)
        }
        
        authCoordinator.start()
        merchCoordinator.start()
        lavenderCoordnator.start(animated: false)
        blueCoordinator.start(animated: false)
        greenCoordinator.start(animated: false)

        viewControllers = [greenCoordinator.navigationController, blueCoordinator.navigationController, lavenderCoordnator.navigationController]
    }
    
    /// Hides BaseTabBarViewController's navigation controller
    func hideNavigationController() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}
