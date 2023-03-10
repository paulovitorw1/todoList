//
//  MainCoordinator.swift
//  todoList
//
//  Created by Paulo Vitor on 08/03/23.
//

import Foundation
import UIKit

class MainCoordinator: CoordinatorProtocol {
    var childCoordinators = [CoordinatorProtocol]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = SelectLoginOrRegisterViewController()
        controller.delegate = self
        navigationController.pushViewController(controller, animated: false)
    }
    
}

extension MainCoordinator: WelcomeScreenViewControllerDelegate {
    func didToLogin() {
//        let controller = WelcomeScreenViewController()
        print("aqui")
    }
}

extension MainCoordinator: SelectLoginOrRegisterViewControllerDelegate {
    func didLogin() {
        print("aqui")

    }
    
    
}
