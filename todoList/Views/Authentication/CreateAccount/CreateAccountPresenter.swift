//
//  CreateAccountPrenseter.swift
//  todoList
//
//  Created by Paulo Vitor on 10/03/23.
//

import Foundation

final class CreateAccountPresenter {
    weak var controller: CreateAccountViewControllerProtocol?
    
    var viewModel = TogglePasswordVisibilityViewModel()
    
    func setupUI() {
        self.controller?.show(viewModel)
    }

    func didCreateAccount(with viewModel: CreateAccountViewModel) {
        guard !viewModel.name.isEmpty,
              !viewModel.email.isEmpty,
              !viewModel.password.isEmpty else { return }

        //TODO: Implement validate data
        
    }
}

extension CreateAccountPresenter: CreateAccountPresenterProtocol {
    func togglePasswordVisibility() {
        viewModel.testee()
        let icon = viewModel.toggleTextFieldEntry == true ? "eye.slash" : "eye"
        let visibily = viewModel.toggleTextFieldEntry

        controller?.togglePasswordVisibility(TogglePasswordVisibilityViewModel(toggleTextFieldEntry: visibily,
                                                                               icon: icon))
    }
}
