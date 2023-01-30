//
//  BaseTabBarController.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2022-11-12.
//

import UIKit

final class BaseTabBarController: UITabBarController {
    var coordinator: RootCoordinator?

    private let authCoordinator = AuthCoordinator(navigationController: UINavigationController())
    private let merchCoordinator = MerchCoordinator(navigationController: UINavigationController())
    private let greenCoordinator = GreenCoordinator(navigationController: UINavigationController())
    private let blueCoordinator = BlueCoordinator(navigationController: UINavigationController())
    private let lavenderCoordnator = LavenderCoordinator(navigationController: UINavigationController())
    private (set) var initCoordinators = [Coordinator]()
    
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

        initCoordinators = coordinator?.childCoordinators ?? []
        viewControllers = [greenCoordinator.navigationController, blueCoordinator.navigationController, lavenderCoordnator.navigationController]
    }
    
    /// Hides BaseTabBarViewController's navigation controller
    func hideNavigationController() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func cleanUpZombieCoordinators() {
        if let currentCoordinators = coordinator?.childCoordinators {
            for item in currentCoordinators {
                let contains = initCoordinators.contains(where: {$0 === item})
                if contains == false {

                    /// Dismissing newly `MerchCoordinator` children coordinators
                    if let merchCoordinator = item as? MerchCoordinator {
                        merchCoordinator.dismissMerchScreens()
                        coordinator?.childDidFinish(merchCoordinator)
                    }
                    
                    /// Removing the `BlueCoordinator` which was added throught the `GreenViewController`
                    if let blueCoordinator = item as? BlueCoordinator, let viewController = blueCoordinator.viewControllerRef as? DisposableViewController {
                        viewController.cleanUp()
                        blueCoordinator.viewControllerRef?.navigationController?.popViewController(animated: false)
                        coordinator?.childDidFinish(blueCoordinator)
                    }
                }
            }
        }
    
    }
}
