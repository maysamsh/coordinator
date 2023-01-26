//
//  LavenderViewController.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-25.
//

import Foundation
import UIKit

final class LavenderViewController: UIViewController, DisposableViewController {
    weak var coordinator: LavenderCoordinator?
    private let loginButton = UIButton()
    
    override func viewDidLoad() {

    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .init(red: 0.89, green: 0.56, blue: 0.91, alpha: 1)
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        loginButton.addTarget(self, action: #selector(loginAction(sender: )), for: .touchUpInside)
    }
    
    @objc
    private func loginAction(sender: UIButton) {
        coordinator?.login()
    }
    
    func cleanUp() {
        coordinator?.coordinatorDidFinish()
    }
    
    deinit {
        ConsoleLogger.classDeInitialized()
    }
}
