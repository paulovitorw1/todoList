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
//        let presenter = CreateAccountPresenter()
        let controller = WelcomeScreenViewController()

        controller.delegate = self
        navigationController.pushViewController(controller, animated: false)
    }
}

extension MainCoordinator: WelcomeScreenViewControllerDelegate {
    func didToGetStarted() {
       let controller = SelectLoginOrRegisterViewController()
        controller.delegate = self
        navigationController.pushViewController(controller, animated: true)
    }
}

extension MainCoordinator: SelectLoginOrRegisterViewControllerDelegate {
    func didLogin() {
        let presenter = CreateAccountPresenter()
        let controller = CreateAccountViewController(presenter: presenter)
        presenter.controller = controller
        controller.delegate = self
        navigationController.pushViewController(controller, animated: true)
    }
}

extension MainCoordinator: CreateAccountViewControllerDelegate {
    func didToHome() {
        //TODO: implement to home
    }
}
