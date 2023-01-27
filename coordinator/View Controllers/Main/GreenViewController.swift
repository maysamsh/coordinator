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

    override func viewDidLoad() {

    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .init(red: 0.74, green: 0.91, blue: 0.56, alpha: 1)
        view.addSubview(termsButton)
        termsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            termsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            termsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let termsButtonAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body), NSAttributedString.Key.foregroundColor: UIColor.black]
        let termsButtonAttibutedTitle = NSMutableAttributedString(string: "Show some text...", attributes: termsButtonAttributes)
        termsButton.setAttributedTitle(termsButtonAttibutedTitle, for: .normal)
        
        termsButton.addTarget(self, action: #selector(termsAction(sender:)), for: .touchUpInside)
    }
    
    @objc
    private func termsAction(sender: UIButton) {
        coordinator?.commonText("Some text here...")
    }

    func cleanUp() {
        coordinator?.coordinatorDidFinish()
    }
}
