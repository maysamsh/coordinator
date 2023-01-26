//
//  ForgotPasswordViewController.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-26.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    weak var coordinator: ForgotPasswordCoordinator?
    
    private let dismissRegistrationButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .init(red: 0.76, green: 0.87, blue: 0.83, alpha: 1)
        
        view.addSubview(dismissRegistrationButton)
        
        let dismissButtonAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body), NSAttributedString.Key.foregroundColor: UIColor.black]
        let dismissButtonAttibutedTitle = NSMutableAttributedString(string: "Dismiss and go back to Home", attributes: dismissButtonAttributes)

        dismissRegistrationButton.setAttributedTitle(dismissButtonAttibutedTitle, for: .normal)
        dismissRegistrationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissRegistrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissRegistrationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        dismissRegistrationButton.addTarget(self, action: #selector(dismissButtonAction(sender:)), for: .touchUpInside)
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
