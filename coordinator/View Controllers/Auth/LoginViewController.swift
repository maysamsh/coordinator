//
//  LoginViewController.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-25.
//

import UIKit

class LoginViewController: UIViewController, DisposableViewController {
    weak var coordinator: LoginCoordinator?
    
    private let signInButton = UIButton()
    private let registerButton = UIButton()
    private let stack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .init(red: 0.61, green: 0.61, blue: 0.61, alpha: 1)
        
        for item in [signInButton, registerButton, stack] {
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        signInButton.setTitle("Login", for: .normal)
        registerButton.setTitle("Register an account", for: .normal)
        
        stack.axis = .vertical
        stack.addArrangedSubview(signInButton)
        stack.addArrangedSubview(registerButton)
        
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        signInButton.addTarget(self, action: #selector(loginAction(sender:)), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(goToRegister(sender:)), for: .touchUpInside)
    }
    
    @objc
    private func loginAction(sender: UIButton) {
        coordinator?.popViewController(animated: true, useCustomAnimation: true)
    }
    
    @objc
    private func goToRegister(sender: UIButton) {
        coordinator?.register()
    }
    
    func cleanUp() {
        coordinator?.coordinatorDidFinish()
    }
    
    deinit {
        ConsoleLogger.classDeInitialized()
    }

}
