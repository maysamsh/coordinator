//
//  BlueViewController.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-24.
//

import Foundation
import UIKit

final class BlueViewController: UIViewController, DisposableViewController {
    weak var coordinator: BlueCoordinator?
    private let productsButton = UIButton()

    override func viewDidLoad() {

    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .init(red: 0.56, green: 0.81, blue: 0.91, alpha: 1)
        
        view.addSubview(productsButton)
        productsButton.translatesAutoresizingMaskIntoConstraints = false
        productsButton.setTitle("Products", for: .normal)
        NSLayoutConstraint.activate([
            productsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        productsButton.addTarget(self, action: #selector(productsAction(sender: )), for: .touchUpInside)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if self.isMovingFromParent {
            cleanUp()
        }
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        coordinator?.parent?.baseTabBarController?.cleanUpMerch()
        print(coordinator?.parent?.baseTabBarController?.merchCoordinator.childCoordinators)
        
    }
    
    
    @objc
    private func productsAction(sender: UIButton) {
        coordinator?.products()
    }
    
    func cleanUp() {
        coordinator?.coordinatorDidFinish()
    }
    
    deinit {
        ConsoleLogger.classDeInitialized()
    }
}
