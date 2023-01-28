//
//  GreenViewController.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-24.
//

import Foundation
import UIKit

final class GreenViewController: UIViewController, DisposableViewController {
    weak var coordinator: GreenCoordinator?
    private let termsButton = UIButton()
    private let blueViewControllerButton = UIButton()
    private let stack = UIStackView()
    
    override func viewDidLoad() {

    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .init(red: 0.74, green: 0.91, blue: 0.56, alpha: 1)
        
        for item in [stack, termsButton] {
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let attributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body), NSAttributedString.Key.foregroundColor: UIColor.black]
        let termsButtonAttibutedTitle = NSMutableAttributedString(string: "Show some text...", attributes: attributes)
        termsButton.setAttributedTitle(termsButtonAttibutedTitle, for: .normal)
        let blueButtonAttributedText = NSMutableAttributedString(string: "Instantiate another blue screeen...", attributes: attributes)
        blueViewControllerButton.setAttributedTitle(blueButtonAttributedText, for: .normal)
        
        stack.axis = .vertical
        stack.spacing = 25
        stack.addArrangedSubview(termsButton)
        stack.addArrangedSubview(blueViewControllerButton)
        
        termsButton.addTarget(self, action: #selector(termsAction(sender:)), for: .touchUpInside)
        blueViewControllerButton.addTarget(self, action: #selector(blueButtonAction(sender: )), for: .touchUpInside)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if self.isMovingFromParent {
            cleanUp()
        }
    }
    
    @objc
    private func blueButtonAction(sender: UIButton) {
        coordinator?.blueScreen()
    }
    
    @objc
    private func termsAction(sender: UIButton) {
        coordinator?.commonText("Some text here...")
    }

    func cleanUp() {
        coordinator?.coordinatorDidFinish()
    }
}
