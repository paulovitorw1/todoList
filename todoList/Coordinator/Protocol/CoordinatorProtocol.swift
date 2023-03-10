//
//  Coordinator.swift
//  todoList
//
//  Created by Paulo Vitor on 07/03/23.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
