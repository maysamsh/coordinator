//
//  RegisterViewController.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-26.
//

import UIKit

class RegisterViewController: UIViewController, DisposableViewController {
    weak var coordinator: RegisterCoordinator?
    
    private let dismissRegistrationButton = UIButton()
    private let forgotPasswordButton = UIButton()
    private let stack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .init(red: 0.91, green: 0.68, blue: 0.56, alpha: 1)
        
        for item in [dismissRegistrationButton, forgotPasswordButton, stack] {
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        dismissRegistrationButton.setTitle("Dismiss and go back to Home", for: .normal)
        
        stack.axis = .vertical
        stack.addArrangedSubview(forgotPasswordButton)
        stack.addArrangedSubview(dismissRegistrationButton)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordAction(sender:)), for: .touchUpInside)
        dismissRegistrationButton.addTarget(self, action: #selector(dismissButtonAction(sender:)), for: .touchUpInside)
    }
    
    @objc
    private func forgotPasswordAction(sender: UIButton) {
        coordinator?.forgotPassword()
    }
    
    @objc
    private func dismissButtonAction(sender: UIButton) {
        coordinator?.dismissAuthScreen()
    }

    func cleanUp() {
        coordinator?.coordinatorDidFinish()
    }
    
    deinit {
        ConsoleLogger.classDeInitialized()
    }

}
