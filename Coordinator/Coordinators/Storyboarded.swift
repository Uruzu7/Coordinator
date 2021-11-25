//
//  Storyboarded.swift
//  Coordinator
//
//  Created by Alexandru Stegaru on 22.11.2021.
//

import UIKit

protocol Storyboarded {
    static func instantiate(_ name: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(_ name: String = "Main") -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}


extension UIViewController: Storyboarded {
    
}
