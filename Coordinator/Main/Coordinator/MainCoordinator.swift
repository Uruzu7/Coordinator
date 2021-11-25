//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Alexandru Stegaru on 22.11.2021.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
//        vc.viewModel = viewModle // create and add viewModel here
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    // Did tap clear
    
    func goToSecond() {
        let coordinator = SecondCoordinator(navigationController: navigationController, parentCoordinator: self)
        coordinator.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at:index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let mainViewController = fromViewController as? ViewController {
            childDidFinish( mainViewController.coordinator )
        }
    }
}
