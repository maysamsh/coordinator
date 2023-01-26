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
    
    override func viewDidLoad() {

    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .init(red: 0.56, green: 0.81, blue: 0.91, alpha: 1)
    }
    
    func cleanUp() {
        coordinator?.coordinatorDidFinish()
    }
    
    deinit {
        ConsoleLogger.classDeInitialized()
    }
}
