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
    
    override func viewDidLoad() {

    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .init(red: 0.74, green: 0.91, blue: 0.56, alpha: 1)
    }
    
    func cleanUp() {
        coordinator?.coordinatorDidFinish()
    }
}
