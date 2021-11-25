//
//  SecondCoordinator.swift
//  Coordinator
//
//  Created by Alexandru Stegaru on 24.11.2021.
//

import UIKit

class SecondCoordinator: Coordinator {
    var parentCoordinator: Coordinator
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, parentCoordinator: Coordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let vc = SecondScreenViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        
    }
}
