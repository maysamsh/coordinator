//
//  SquareViewController.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-27.
//

import UIKit

class SquareViewController: UIViewController, DisposableViewController {
    weak var coordinator: SquareCoordinator?
    private let termsButton = UIButton()
    
    var productID: String?
    
    override func viewDidLoad() {

    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .init(red: 0.36, green: 0.61, blue: 0.71, alpha: 1)
        self.title = self.productID
        view.addSubview(termsButton)
        termsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            termsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            termsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        termsButton.setTitle("Show Terms", for: .normal)
        termsButton.addTarget(self, action: #selector(termsAction(sender:)), for: .touchUpInside)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if self.isMovingFromParent {
            cleanUp()
        }
    }
    
    @objc
    private func termsAction(sender: UIButton) {
        coordinator?.terms(text: "Terms and conditions")
    }
    
    func cleanUp() {
        coordinator?.coordinatorDidFinish()
    }
    
    deinit {
        ConsoleLogger.classDeInitialized()
    }
}
