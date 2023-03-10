//
//  OnboardingProtocols.swift
//  todoList
//
//  Created by Paulo Vitor on 08/03/23.
//

import Foundation
import UIKit

protocol WelcomeScreenViewProtocol: UIView {
    var buttonGetStartedTapped: (() -> Void)? { get set }
    
    func show()
}

protocol WelcomeScreenViewControllerProtocol: UIViewController {
    var buttonGetStartedTapped: (() -> Void)? { get set }
    
    func show()
}

protocol WelcomeScreenViewControllerDelegate: AnyObject {
    func didToLogin()
}
