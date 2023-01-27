//
//  ProductsViewController.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-27.
//

import UIKit

class ProductsViewController: UIViewController , DisposableViewController {
    weak var coordinator: ProductsCoordinator?
    private let squareProduct1 = UIButton()
    private let squareProduct2 = UIButton()
    private let stack = UIStackView()
    
    override func viewDidLoad() {

    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .init(red: 0.46, green: 0.71, blue: 0.81, alpha: 1)
        self.title = "Products"
        
        for item in [squareProduct1, squareProduct2, stack] {
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        stack.axis = .horizontal
        stack.spacing = 15
        stack.addArrangedSubview(squareProduct1)
        stack.addArrangedSubview(squareProduct2)
        
        squareProduct1.setTitle("Products 1", for: .normal)
        squareProduct2.setTitle("Products 2", for: .normal)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        squareProduct1.addTarget(self, action: #selector(square1Action(sender: )), for: .touchUpInside)
        squareProduct2.addTarget(self, action: #selector(square2Action(sender: )), for: .touchUpInside)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if self.isMovingFromParent {
            cleanUp()
        }
    }
    
    @objc
    private func square1Action(sender: UIButton) {
        coordinator?.product(ID: "Square 1")
    }
    
    @objc
    private func square2Action(sender: UIButton) {
        coordinator?.product(ID: "Square 2")
    }
    
    func cleanUp() {
        coordinator?.coordinatorDidFinish()
    }
    
    deinit {
        ConsoleLogger.classDeInitialized()
    }
}
