//
//  WhiteViewController.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-20.
//

import Foundation
import UIKit

final class WhiteViewController: UIViewController {
    override func viewDidLoad() {
        tabBarItem = UITabBarItem(title: "White", image: nil, selectedImage: nil)
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
    }
}
