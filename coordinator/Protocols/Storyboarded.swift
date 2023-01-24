//
//  Storyboarded.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2022-11-12.
//

import Foundation
import UIKit

/// Allowing view controllers created in the Storyboard to be initiated programmatically.
protocol Storyboarded {
    /**
     A static function which returns an instace of a View Controller which indicated by a string name.
     -  Parameters:
        - name: Name of the Storyboard
     
     - Returns: An instance of a UIViewController which is indicated by its `Storyboard ID`
     */
    static func instantiate(storyboard: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    /**
     Default implementation of the static function which returns an instace of a View Controller which indicated by a string name.
     -  Parameters:
        - name: Name of the Storyboard
     
     - Returns: An instance of a UIViewController which is indicated by its `Storyboard ID`
     */
    static func instantiate(storyboard: String) -> Self {
        let viewControllerName = NSStringFromClass(self)
        let className = viewControllerName.components(separatedBy: ".")[1]
        let storyboardObject = UIStoryboard(name: storyboard, bundle: Bundle.main)
        return storyboardObject.instantiateViewController(withIdentifier: className) as! Self
    }
}
