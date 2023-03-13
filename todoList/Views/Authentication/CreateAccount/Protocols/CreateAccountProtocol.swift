//
//  CreateAccount.swift
//  todoList
//
//  Created by Paulo Vitor on 10/03/23.
//

import Foundation
import UIKit

protocol CreateAccountViewProtocol: UIView {
    var didTappedCreateAccount: ((CreateAccountViewModel) -> Void)? { get set }
    var didTappedToLogin: (() -> Void)? { get set }
    var didTappedTogglePasswordVisibility: (() -> Void)? { get set }
    
    func show(_ viewModel: TogglePasswordVisibilityViewModel)
    func togglePasswordVisibility(_ viewModel: TogglePasswordVisibilityViewModel)
}

protocol CreateAccountViewControllerDelegate: AnyObject {
   func didToHome()
}

protocol CreateAccountViewControllerProtocol: AnyObject {
    func show(_ viewModel: TogglePasswordVisibilityViewModel)
    func togglePasswordVisibility(_ viewModel: TogglePasswordVisibilityViewModel)
}

protocol CreateAccountPresenterProtocol {
    func setupUI()
    func didCreateAccount(with viewModel: CreateAccountViewModel)
    func togglePasswordVisibility()
}
