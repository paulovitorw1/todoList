//
//  CreateAccountViewController.swift
//  todoList
//
//  Created by Paulo Vitor on 10/03/23.
//

import UIKit

final class CreateAccountViewController: UIViewController {
    weak var delegate: CreateAccountViewControllerDelegate?
    let presenter: CreateAccountPresenterProtocol

    var contentView: CreateAccountViewProtocol

    init(contentView: CreateAccountViewProtocol = CreateAccountView(),
         presenter: CreateAccountPresenterProtocol) {
        self.contentView = contentView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
        setupViewBindings()
        presenter.setupUI()
    }
    
    private func setupViewBindings() {
        contentView.didTappedCreateAccount = { [weak self] accountViewModel in
            self?.presenter.didCreateAccount(with: accountViewModel)
        }
        
        contentView.didTappedToLogin = {
            
        }

        contentView.didTappedTogglePasswordVisibility = { [weak self] in
            self?.presenter.togglePasswordVisibility()
        }
    }
}

extension CreateAccountViewController: CreateAccountViewControllerProtocol {
    func show(_ viewModel: TogglePasswordVisibilityViewModel) {
        contentView.show(viewModel)
        print("viewController Show")
    }

    func togglePasswordVisibility(_ viewModel: TogglePasswordVisibilityViewModel) {
        print("ViewController togglePasswordVisibility")
        contentView.togglePasswordVisibility(viewModel)
    }
}
